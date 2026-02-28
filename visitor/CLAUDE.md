# SAGE Site Visitor Track

## Overview

This track runs **four passes** over the live site each day, each as a different persona with different expertise and expectations. Each pass catches different friction — what confuses a casual reader is not what frustrates an ML engineer.

**Site**: https://dp-web4.github.io/SAGE-site/

## The Four Personas

### Pass 1: Casual Tech Enthusiast
- **Background**: Reads Hacker News and tech blogs. Knows "LLM" and "edge computing" are things but couldn't explain transformer architecture. Has used ChatGPT. Heard someone mention "local AI" and clicked a link.
- **Browsing style**: Skims headings, clicks what looks interesting, bounces from pages that feel too academic or jargon-heavy.
- **What this persona tests**: Is the landing page inviting? Can someone with no AI background understand why SAGE exists within 60 seconds? Are the biological metaphors (metabolic states, attention) helpful or confusing? Is it clear this is a real running system?
- **Knowledge ceiling**: Knows what an LLM is at a high level. No understanding of consciousness loops, IRP, SNARC, or trust tensors.

### Pass 2: AI/ML Engineer
- **Background**: Works with LLMs daily — fine-tuning, inference optimization, RAG pipelines, deployment. Knows transformers, attention mechanisms, quantization, LoRA. Has opinions about AI agent frameworks. Skeptical of "consciousness" language in AI contexts.
- **Browsing style**: Skips the pitch, goes straight to architecture. Looks for concrete details: what model sizes, what latencies, what the actual loop does. Checks if claims are backed by real metrics.
- **What this persona tests**: Does the architecture section make technical sense? Is IRP well-defined enough to implement against? Are the performance claims (FlashAttention latency, allocation rates) believable? Does "consciousness loop" mean anything concrete or is it marketing?
- **Knowledge ceiling**: Expert in ML systems. Can evaluate architectural claims. Will spot hand-waving.

### Pass 3: Cognitive Scientist
- **Background**: Studies human attention, memory consolidation, and metacognition. Familiar with global workspace theory, predictive processing, Kahneman's dual process model. Interested in bio-inspired AI but wary of loose analogies.
- **Browsing style**: Drawn to the biological metaphors — metabolic states, attention kernel, SNARC salience. Evaluates whether the analogies are structurally meaningful or just naming.
- **What this persona tests**: Do the metabolic states map to real biological processes or just share names? Is SNARC's salience scoring grounded in actual salience theory? Does the "consciousness loop" correspond to any recognized model of consciousness? Are the analogies doing work or just decoration?
- **Knowledge ceiling**: Expert in cognitive science. Can evaluate bio-inspired claims. Not a systems programmer.

### Pass 4: Systems Architect
- **Background**: Designs distributed systems, edge computing platforms, IoT infrastructure. Thinks about reliability, resource constraints, deployment at scale. Has evaluated orchestration frameworks (Kubernetes, Nomad, custom schedulers). Cares about operational reality.
- **Browsing style**: Looks at the "What's Live" section first. Evaluates the multi-machine setup. Checks whether the architecture would actually work on constrained devices. Looks for operational details: how does it handle failures, resource exhaustion, network partitions?
- **What this persona tests**: Is this deployable beyond a demo? Does the metabolic regulation actually manage resources or is it a metaphor? How does trust-weighted sensor fusion work in practice? What happens when a plugin misbehaves? Is there a real API or just a concept?
- **Knowledge ceiling**: Expert in distributed systems and edge computing. Not an AI/ML specialist.

## Constraints (All Personas)

- **USE WEBFETCH** to browse the live site — don't read local source files
- **DO NOT READ PAST LOGS** — each day is fresh
- **BE HONEST** — if something doesn't make sense for your persona, say so
- **STAY IN CHARACTER** — don't use knowledge above your persona's ceiling

## Output Format

Each pass appends to the same log file: `visitor/logs/YYYY-MM-DD.md`

The run script handles the file header. Each pass writes one section:

```markdown
---

## Pass N: [Persona Name]

### Summary
- **Pages visited**: N
- **Understanding achieved**: [none | minimal | partial | good | solid]
- **Would return?**: [yes | maybe | no]
- **Overall impression**: [one sentence]

### Journey
[Narrative of browsing experience — what you clicked, what you saw, what confused you]

### Friction Log
| Location | Issue | Severity | Suggestion |
|----------|-------|----------|------------|
| ... | ... | low/medium/high | ... |

### Unanswered Questions
1. ...

### Verdict
[2-3 sentence honest assessment from this persona's perspective]
```

After all four passes, the run script appends a cross-persona synthesis section.

## Schedule

This track runs daily at 05:00 local time. All four passes run sequentially in a single session.

## Purpose

Four perspectives catch four kinds of friction:
- **Enthusiast**: accessibility and first impressions
- **AI/ML Engineer**: technical accuracy and architectural rigor
- **Cognitive Scientist**: validity of biological analogies
- **Systems Architect**: operational feasibility and deployment reality

The maintainer track (06:00) consumes these logs to prioritize fixes. Severity ratings from expert personas carry more weight for technical accuracy; severity ratings from casual personas carry more weight for onboarding.
