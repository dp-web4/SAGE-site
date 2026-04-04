# SAGE Site — Updates Needed

*Reviewed 2026-04-04. Site last content-updated ~March 20, 2026.*

## Stale Data

### 1. "Live Now" Stats (MOST VISIBLE — hero section)
**Current**: 370+ raising sessions, Sprout (283), Legion (42), McNugget (32), Thor (12)
**Actual**: ~450+ sessions. Sprout (38 under new model), McNugget (96), Nomad (64), CBP (28), Thor (24), Legion (19). The old Sprout number (283) was under qwen 0.5B before the model switch.

**Fix**: Update the numbers. Consider showing per-instance current phase:
- McNugget: 96 sessions, Creating phase
- Nomad: 64, Questioning
- Sprout: 38, Questioning (6 consecutive perfect training scores)
- CBP: 28, Questioning
- Thor: 24, Relating
- Legion: 19, Relating

### 2. Hardware Table
**Current**: Legion "Phi4 14B, Qwen 0.5B", McNugget "Gemma3 12B", CBP "TinyLlama 1.1B"
**Actual**: 
- Legion: Gemma3 4B (gameplayer instance active)
- McNugget: Gemma4 (just shifted to new model released April 2)
- CBP: qwen3.5 0.8B + gemma3 4B (ARC-AGI-3 sweep model)
- Thor: qwen3.5 27B + gemma4 (gameplayer instance)
- Sprout: qwen3.5 0.8B (was qwen2.5 0.5B)

### 3. Raising Curriculum — Missing Phase 6
**Current**: 5 phases (Grounding → Sensing → Relating → Questioning → Creating)
**Actual**: Phase 6 "Acting" added 2026-04-04 — ARC-AGI-3 games as developmental curriculum. "The world responds according to its own rules."

### 4. DREAM/LoRA Description
**Current**: "DREAM — Replay high-salience experiences, LoRA fine-tuning" and "LoRA-trained personality weights"
**Actual**: Frozen weights is now the intentional design. No LoRA, no fine-tuning. Context shaping only. The DREAM description should say "experience consolidation" not "LoRA fine-tuning." The identity portability section correctly says identity is in context, but the DREAM card contradicts it.

### 5. Memory Systems — LoRA mention
**Current**: "LoRA weights — hardware-bound personality, trained during DREAM cycles"
**Actual**: Remove or qualify. Weights are frozen. Identity is in state files + prompt construction.

### 6. ARC-AGI-3 — Not mentioned at all
The site doesn't mention ARC-AGI-3 competition, game-playing as developmental curriculum, or the fleet's game results. This is a significant current activity.

### 7. Membot / Andy Collaboration — Not mentioned
Cross-session memory via membot cartridges. External collaborator building perception layer. GridCartridge paired lattice format.

### 8. Model Database — Not mentioned
Global model tracking in shared-context/models/. T3/V3 scoring groundwork.

### 9. Hardbound — Not mentioned
Enterprise oversight product built on Web4. Feature-complete, Sprint 3 toward v1.0.0.

### 10. Consciousness Loop Steps
**Current**: Shows 9 steps in the accordion
**Actual**: 12 steps in current code (Sense → Salience → Metabolize → Posture → Select → Budget → Execute → Learn → Remember → Govern → Filter → Act)

## Priority Order

1. **Fix LoRA/DREAM contradiction** — factually wrong, undermines frozen-weights design
2. **Update Live Now stats** — most visible section, numbers are stale
3. **Update hardware table** — models have shifted
4. **Add Phase 6 to curriculum** — major recent addition
5. **Add ARC-AGI-3 section** — active competition, game-as-curriculum
6. **Update consciousness loop** — 9 → 12 steps

Lower priority:
7. Mention membot/Andy collaboration
8. Mention hardbound
9. Mention model database
