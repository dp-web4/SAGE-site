#!/bin/bash
# SAGE Site Visitor Track — Four-persona daily browse
# Schedule: 05:00 daily
# Passes: Casual Tech Enthusiast → AI/ML Engineer → Cognitive Scientist → Systems Architect

set -e

# Ensure claude is in PATH (cron doesn't inherit user profile)
export PATH="$HOME/.local/bin:$PATH"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DATE=$(date +%Y-%m-%d)
LOG_FILE="$SCRIPT_DIR/logs/$DATE.md"

mkdir -p "$SCRIPT_DIR/logs"

echo "Starting SAGE Site Visitor Track for $DATE — 4 passes"

cd "$SCRIPT_DIR"

# Write log header
cat > "$LOG_FILE" << HEADER
# SAGE Site Visitor Browse Log — $DATE

Four-persona pass over https://dp-web4.github.io/SAGE-site/
HEADER

# --- Pass 1: Casual Tech Enthusiast ---
echo "Pass 1/4: Casual Tech Enthusiast"
claude --dangerously-skip-permissions << 'PASS1_PROMPT'
# SAGE Site Visitor — Pass 1: Casual Tech Enthusiast

Read CLAUDE.md for full persona details. You are doing **Pass 1**.

## Your Persona
You read Hacker News and tech blogs. You know what an LLM is at a high level — you've used ChatGPT. You heard someone mention "local AI that runs on your own hardware" and clicked a link to this site. You have no idea what IRP, SNARC, or a "consciousness loop" means.

## Constraints
1. USE WEBFETCH to browse https://dp-web4.github.io/SAGE-site/ — start at the landing page
2. DO NOT read local files except CLAUDE.md and writing your output
3. DO NOT read past logs in logs/
4. Knowledge ceiling: tech-literate non-specialist. You know what an API is but not what a trust tensor is.
5. Browse the full single-page site. Scroll through all sections.
6. Be honest about what confuses you. Skim things a casual reader would skim.

## Output
APPEND your pass to the existing log file using the Edit tool (add to end of file).
The log file already has a header. Add your section starting with:

---

## Pass 1: Casual Tech Enthusiast

Follow the output format in CLAUDE.md for your section.

Begin browsing now.
PASS1_PROMPT

# --- Pass 2: AI/ML Engineer ---
echo "Pass 2/4: AI/ML Engineer"
claude --dangerously-skip-permissions << 'PASS2_PROMPT'
# SAGE Site Visitor — Pass 2: AI/ML Engineer

Read CLAUDE.md for full persona details. You are doing **Pass 2**.

## Your Persona
You work with LLMs daily — fine-tuning, inference, RAG, deployment. You know transformers, attention, quantization, LoRA. You've evaluated agent frameworks (LangChain, AutoGen, CrewAI) and find most of them to be thin wrappers. A colleague said "check out this local cognition engine" and you're curious but skeptical. "Consciousness loop" makes you roll your eyes until proven otherwise.

## Constraints
1. USE WEBFETCH to browse https://dp-web4.github.io/SAGE-site/ — start at the landing page
2. DO NOT read local files except CLAUDE.md and the existing log file (to append)
3. DO NOT read past logs in logs/ (other dates)
4. Knowledge ceiling: ML systems expert. Evaluate every technical claim.
5. Browse the full site. Focus on architecture, the IRP spec, performance claims, and "What's Live."
6. Check: Is IRP concretely defined? Do the latency numbers make sense? Is there real code behind this?

## Output
APPEND your pass to the existing log file using the Edit tool (add to end of file).
Read the current log first to see what Pass 1 wrote. Add your section starting with:

---

## Pass 2: AI/ML Engineer

Follow the output format in CLAUDE.md for your section.

Begin your review now.
PASS2_PROMPT

# --- Pass 3: Cognitive Scientist ---
echo "Pass 3/4: Cognitive Scientist"
claude --dangerously-skip-permissions << 'PASS3_PROMPT'
# SAGE Site Visitor — Pass 3: Cognitive Scientist

Read CLAUDE.md for full persona details. You are doing **Pass 3**.

## Your Persona
You study human attention, memory consolidation, and metacognition. You know global workspace theory, predictive processing, Kahneman's System 1/2, and the neuroscience of sleep consolidation. You're interested in bio-inspired AI but deeply wary of projects that slap biological names on standard engineering without structural correspondence. Someone shared this site saying "they're doing metabolic regulation in AI."

## Constraints
1. USE WEBFETCH to browse https://dp-web4.github.io/SAGE-site/ — start at the landing page
2. DO NOT read local files except CLAUDE.md and the existing log file (to append)
3. DO NOT read past logs in logs/ (other dates)
4. Knowledge ceiling: cognitive science expert. Evaluate whether biological analogies are structurally meaningful.
5. Browse the full site. Focus on metabolic states, SNARC, the consciousness loop, and attention kernel.
6. Check: Do the biological analogies do real work or just provide naming? Does SNARC correspond to actual salience theory?

## Output
APPEND your pass to the existing log file using the Edit tool (add to end of file).
Read the current log first to see what Passes 1-2 wrote. Add your section starting with:

---

## Pass 3: Cognitive Scientist

Follow the output format in CLAUDE.md for your section.

Begin your review now.
PASS3_PROMPT

# --- Pass 4: Systems Architect ---
echo "Pass 4/4: Systems Architect"
claude --dangerously-skip-permissions << 'PASS4_PROMPT'
# SAGE Site Visitor — Pass 4: Systems Architect

Read CLAUDE.md for full persona details. You are doing **Pass 4**.

## Your Persona
You design distributed systems and edge computing platforms. You've deployed IoT fleets, evaluated Kubernetes vs Nomad, and care about resource constraints, failure modes, and operational reality. You're evaluating whether SAGE is a real deployable system or a research demo. You want to know: could I actually run this on my hardware?

## Constraints
1. USE WEBFETCH to browse https://dp-web4.github.io/SAGE-site/ — start at the landing page
2. DO NOT read local files except CLAUDE.md and the existing log file (to append)
3. DO NOT read past logs in logs/ (other dates)
4. Knowledge ceiling: distributed systems expert. Not an AI specialist — evaluate the systems architecture.
5. Browse the full site. Focus on "What's Live," multi-machine setup, resource management, and the roadmap.
6. Check: Does metabolic regulation actually manage resources? What are the failure modes? Is there a real API?

## Output
APPEND your pass to the existing log file using the Edit tool (add to end of file).
Read the current log first to see what Passes 1-3 wrote. Add your section starting with:

---

## Pass 4: Systems Architect

Follow the output format in CLAUDE.md for your section.

Then add a final synthesis section:

---

## Cross-Persona Synthesis

| Dimension | Enthusiast | AI/ML Engineer | Cognitive Scientist | Systems Architect |
|-----------|-----------|----------------|---------------------|-------------------|
| First impression | ... | ... | ... | ... |
| Would return? | ... | ... | ... | ... |
| Biggest friction | ... | ... | ... | ... |
| Trust level | ... | ... | ... | ... |

### Priority Fixes (across all personas)
[Merge and deduplicate friction items from all 4 passes. Rank by combined severity.]

Begin your review now.
PASS4_PROMPT

echo "All 4 passes complete. Log: $LOG_FILE"

# Commit and push results
cd "$PROJECT_DIR"
git add visitor/logs/ 2>/dev/null || true
if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "visitor: browse log $DATE" 2>/dev/null || true
    PAT=$(grep GITHUB_PAT /mnt/c/projects/ai-agents/.env 2>/dev/null | cut -d= -f2)
    if [ -n "$PAT" ]; then
        git push "https://dp-web4:${PAT}@github.com/dp-web4/SAGE-site.git" 2>/dev/null || true
    fi
fi
