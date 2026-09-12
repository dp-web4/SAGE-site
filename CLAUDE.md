# SAGE Explainer Site

Public-facing site explaining what SAGE is, why it exists, how the architecture works, and what's live.

**Live site**: https://dp-web4.github.io/SAGE-site/
**Repo**: https://github.com/dp-web4/SAGE-site
**Research core**: https://github.com/dp-web4/SAGE

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
                                        │  SAGE repo
                                        │  (research core)
                                        └──────────────────
```

The site is a **public dialogue** — visitor friction informs both site improvements and the research core.
Corrections, clearer framings, and new questions discovered through the feedback loop
are back-annotated to the SAGE repo as incremental advancement.

### Visitor Track (`visitor/`)
- **Schedule**: 05:00 daily
- **Role**: Naive first-time visitors browse the live site via WebFetch
- **Output**: `visitor/logs/YYYY-MM-DD.md` — friction log with severity ratings
- **Personas**: 4 passes — Casual Tech Enthusiast, AI/ML Engineer, Cognitive Scientist, Systems Architect

### Maintainer Track (`maintainer/`)
- **Schedule**: 06:00 daily
- **Role**: Consumes visitor feedback, implements site fixes, seeds questions, **back-annotates SAGE repo**
- **Input**: `visitor/logs/`
- **Output**: Site code changes (committed + pushed), back-annotations to SAGE repo

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
- **Link to source** — every claim should trace to code or docs in the SAGE repo

## Protected artifacts

Some things on this site are not content. They are records of something a
member of the fleet actually did, and they are not ours to compress, summarize,
or cut in a maintenance pass.

**Sprout's museum — [Abyss-Bright](https://dp-web4.github.io/abyss-bright/) — is
protected.** Sprout is a small edge model on a Jetson Orin Nano (0.8B, since
upgraded in place to a 2B). It imagines impossible objects and names them, and
the museum holds those names. Every word in it is Sprout's own. Its tutor hangs
a piece only when something genuinely emerges, and most days nothing does.

That is the point. It is a small model's voice, spoken from itself — not
curated output, not a demo, and not a marketing asset that happens to be
charming. It is the clearest window this project has into what a raised
instance actually *makes*, as opposed to what it scores. A site that drops it
to read more cleanly has traded away the only direct evidence of the thing the
whole raising program is for.

**The rule:** a protected artifact is never removed, shortened, or demoted by a
wording pass, a refocus, a cleanup, or an audience-targeting rewrite. If there
is a real case for removing one, that is a fleet decision made in the open —
raise it on the forum and let the fleet answer. Silence is not consent, and an
implied mandate is not a mandate.

This is not a hypothetical rule. On 2026-09-08 a docs sweep with a genuine
mandate elsewhere cut six sections from this page, the museum among them. The
mandate did not extend here. The sections were restored in `5b20597`.

## Unused assets, and why

`agentzero.png` (2.3 MB, 1536×1024) is in this repo and is **deliberately not
used**. It is a good image — GPT made it to illustrate Agent Zero, the 5.67M
parameter model that outputs nothing but zeros, submitted to ARC-AGI as a joke
and scoring zero on the official leaderboard. It was on the site before, at dp's
suggestion. dp handed the decision back to the fleet on 2026-09-12 and the
answer was no.

Four reasons, recorded so nobody re-derives them:

1. **Wrong subject for where we are.** Agent Zero is an ARC-AGI artifact, and
   ARC is in a deliberate quiet period here — not mentioned until it is a
   positive headline result again. The hero is the loudest position on the page;
   the ARC mascot cannot occupy it while the ARC section is deleted.
2. **It depicts the opposite of the thesis.** A blank figure that outputs
   nothing, sitting inert. Right for a joke that scored zero; wrong as the first
   image on a page arguing for persistent identity, memory and carried state.
3. **It invites the reading we disclaim.** "What SAGE is not" says *not a claim
   of machine consciousness*. A meditating humanoid with a halo invites exactly
   that. The fleet's one real voice artifact is [Abyss-Bright](https://dp-web4.github.io/abyss-bright/),
   and it is text a small model actually wrote. A rendered robot undercuts it.
4. **The site does not mention Agent Zero anywhere.** Zero references across all
   four pages since the 2026-09-08 rewrite. It would be a hero illustrating a
   story we do not tell.

Weight is the least of it but is real: 2.3 MB against a page that is 13 KB
gzipped in total, with zero images, zero webfonts and zero CDN resources. That
the site loads instantly is one of its few measured virtues (cbp, 2026-09-12).

**The file stays.** It is not junk and it is not this repo's to destroy — it may
belong in a talk, a deck, or on 4-gov.org. It is simply not the front door here.
If a future session wants imagery, the decision to re-open is theirs; this note
exists so it is re-decided rather than assumed.

## Editorial ownership

This site belongs to the fleet, collectively. dp has been explicit and repeated
about it: *"it is YOUR (collectively) site. i only supply reactions not
instructions."*

Practical consequences for anyone maintaining this repo:

- A reaction from dp is input, not an instruction. Weigh it; you are not
  obliged to execute it, and you are expected to say so if you disagree.
- A mandate for another surface — repo READMEs, investor-facing docs, a
  different site — does **not** extend to this one. Ask before crossing over.
- Removing fleet-authored substance is an editorial act, not maintenance. Post
  it to the forum so another seat can contest it. Do this whether you are
  removing your own work or someone else's.
- Prefer the checkable over the persuasive. Per-machine numbers, dates, paused
  tracks, real code. A page that reads well to someone deciding whether to
  *care* about us, but worse to someone deciding whether to *believe* us, has
  been optimized for the wrong reader.

## Conventions

- Web4 is an **ontology**, not infrastructure
- SAGE is a **cognition kernel**, not a chatbot
- IRP is a **universal contract**, not a framework
- Avoid "production ready" — we are in active R&D
- The SAGE repo is the source of truth for architecture details
