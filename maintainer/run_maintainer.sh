#!/bin/bash
# SAGE Site — Maintainer Track
# Schedule: 06:00 daily (1 hour after visitor, so fresh feedback is available)

set -e

# Ensure claude is in PATH (cron doesn't inherit user profile)
export PATH="$HOME/.local/bin:$PATH"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H%M)
LOG_FILE="$SCRIPT_DIR/logs/$DATE-$TIME.log"

# Ensure log directory exists
mkdir -p "$SCRIPT_DIR/logs"

echo "Starting SAGE Site Maintainer Session at $(date)" | tee "$LOG_FILE"

cd "$SCRIPT_DIR"

# GitNexus graph maintenance — ensure indexes are fresh before session
source /mnt/c/exe/projects/ai-agents/scripts/gitnexus-maintain.sh 2>/dev/null || true
gitnexus_ensure_fresh "$PROJECT_DIR" 2>>"$LOG_FILE" || true
gitnexus_ensure_fresh "/mnt/c/exe/projects/ai-agents/SAGE" 2>>"$LOG_FILE" || true

# Check for fresh visitor feedback
VISITOR_LOG="$PROJECT_DIR/visitor/logs/$DATE.md"
VISITOR_CONTEXT=""
if [ -f "$VISITOR_LOG" ]; then
    VISITOR_CONTEXT="Fresh visitor feedback available at ../visitor/logs/$DATE.md — review and prioritize fixes."
fi

# Check for recent visitor logs if today's isn't available
if [ -z "$VISITOR_CONTEXT" ]; then
    RECENT=$(ls -t "$PROJECT_DIR/visitor/logs/"*.md 2>/dev/null | head -1)
    if [ -n "$RECENT" ]; then
        RECENT_NAME=$(basename "$RECENT")
        VISITOR_CONTEXT="No visitor log for today. Most recent: ../visitor/logs/$RECENT_NAME"
    fi
fi

# Launch maintainer session
claude --dangerously-skip-permissions << EOF >> "$LOG_FILE" 2>&1
# SAGE Site — Maintainer Session ($DATE)

You are running an automated maintainer session. Your instructions are in CLAUDE.md.

## Today's Context

$VISITOR_CONTEXT

## Your Task

Follow the workflow in CLAUDE.md:
1. Review visitor feedback
2. Triage by severity (HIGH → MEDIUM → LOW)
3. Implement fixes — edit site files, commit and push
4. Ponder what the feedback reveals about deeper gaps
5. Back-annotate findings to the HRM repo if warranted
6. Write your session log to logs/$DATE.md

Be concrete. Make real changes. Push when done.
EOF

echo "Maintainer session complete. Log: $LOG_FILE"

# Commit and push results
cd "$PROJECT_DIR"
git add maintainer/logs/ index.html style.css script.js 2>/dev/null || true
if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "maintainer: session $DATE" 2>/dev/null || true
    PAT=$(grep GITHUB_PAT /mnt/c/projects/ai-agents/.env 2>/dev/null | cut -d= -f2)
    if [ -n "$PAT" ]; then
        git push "https://dp-web4:${PAT}@github.com/dp-web4/SAGE-site.git" 2>/dev/null || true
    fi
    gitnexus_reindex "$PROJECT_DIR" 2>>"$LOG_FILE" || true
fi
