# SAGE Explainer Site

Public-facing site explaining what SAGE is, why it exists, how the architecture works, and what's live.

**Live site**: https://dp-web4.github.io/SAGE-site/
**Repo**: https://github.com/dp-web4/SAGE-site
**Research core**: https://github.com/dp-web4/HRM

## Web4 Ontological Context

```
Web4 = MCP + RDF + LCT + T3/V3*MRH + ATP/ADP
```

SAGE is the runtime that embodies Web4 — metabolic regulation (ATP/ADP), trust tensors (T3/V3), identity (LCT), structured reasoning (MRH). The site externalizes this for human audiences.

## Tech Stack

- Plain HTML, CSS, JavaScript — no build step, no framework, no dependencies
- Single `index.html` + `style.css` + `script.js`
- GitHub Pages deployment (push to `main` triggers rebuild)

## Track Ecosystem

Two autonomous tracks form a daily feedback loop:

```
Visitor (05:00)  →  friction logs  →  Maintainer (06:00)
                                        │    │
                                        │    │  back-annotate
                                        │    ↓
                                        │  HRM repo
                                        │  (research core)
                                        └──────────────────
```

The site is a **public dialogue** — visitor friction informs both site improvements and the research core.
Corrections, clearer framings, and new questions discovered through the feedback loop
are back-annotated to the HRM repo as incremental advancement.

### Visitor Track (`visitor/`)
- **Schedule**: 05:00 daily
- **Role**: Naive first-time visitors browse the live site via WebFetch
- **Output**: `visitor/logs/YYYY-MM-DD.md` — friction log with severity ratings
- **Personas**: 4 passes — Casual Tech Enthusiast, AI/ML Engineer, Cognitive Scientist, Systems Architect

### Maintainer Track (`maintainer/`)
- **Schedule**: 06:00 daily
- **Role**: Consumes visitor feedback, implements site fixes, seeds questions, **back-annotates HRM repo**
- **Input**: `visitor/logs/`
- **Output**: Site code changes (committed + pushed), back-annotations to HRM repo

## Key Files

```
SAGE-site/
├── index.html          # Single-page site with all sections
├── style.css           # Dark theme, responsive
├── script.js           # Nav, accordions, scroll behavior
├── visitor/            # Visitor track
│   ├── CLAUDE.md
│   ├── run_visitor.sh
│   └── logs/
├── maintainer/         # Maintainer track
│   ├── CLAUDE.md
│   ├── run_maintainer.sh
│   └── logs/
└── CLAUDE.md           # This file
```

## Site Culture: Show, Don't Hype

SAGE is a real system running on real hardware. The site should:

- **Be concrete** — show what's live, what works, what doesn't yet
- **Be honest** — SAGE is experimental, in active development, not a product
- **Explain the why** — not just features, but the reasoning behind architectural choices
- **Respect the visitor** — don't assume they know what IRP or SNARC means. Define terms.
- **Link to source** — every claim should trace to code or docs in the HRM repo

## Conventions

- Web4 is an **ontology**, not infrastructure
- SAGE is a **cognition kernel**, not a chatbot
- IRP is a **universal contract**, not a framework
- Avoid "production ready" — we are in active R&D
- The HRM repo is the source of truth for architecture details
