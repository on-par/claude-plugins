---
name: rpi:plan
description: Create an implementation plan from research document
argument-hint: [path to research.md]
---

Create a detailed implementation plan based on the research document provided.

**Research Document Path:** $ARGUMENTS

# Planning Instructions

1. **Read the Research Document**: Use the Read tool to load the complete research document from the provided path.

2. **Generate Implementation Plan**: Use the Task tool to launch the software-task-planner agent with the following context:
   - All findings from the research document
   - Problem statement and objectives
   - Proposed solution approach
   - Codebase analysis results
   - Recommended libraries and tools
   - Integration points and affected files

3. **Create Plan Document**: After the software-task-planner agent completes, extract the plan and save it to a `plan.md` file in the same directory as the research document.

**Path Construction:**
- Extract the directory path from $ARGUMENTS
- Save `plan.md` in that same directory
- Example: If $ARGUMENTS is `rpi/oauth-implementation/research.md`, save to `rpi/oauth-implementation/plan.md`
- Example: If $ARGUMENTS is `research.md`, save to `./plan.md`

# Plan Output Requirements

The `plan.md` file must follow this lean, TDD-focused structure:

---

## Problem Summary
- Brief overview of what is being implemented (1-2 sentences)
- Reference to the research document

## Prerequisites
- Required dependencies or tools to install
- Environment setup needed
- Any blocking issues that must be resolved first
- ⚠️ Critical risks inline (e.g., "⚠️ This changes the auth flow - ensure feature flag is enabled")

## Implementation Phases

Aim for 3-5 phases. If more are needed, consider breaking into multiple plans or confirm with the user.

Each phase follows this structure:

### Phase N: [Descriptive Title for Skimmability]

**Goal:** Single sentence describing what this phase accomplishes.

**Context:**
- Key file references (e.g., "Builds on `src/services/user.service.ts`")
- Pattern references (e.g., "See Appendix A for validation pattern")

**Tasks:**

Tasks follow TDD Red-Green-Refactor. Each feature/unit gets this triplet:

- [ ] 🔴 Write unit test for [specific behavior] (expect fail)
- [ ] 🟢 Implement [specific behavior] (expect pass)
- [ ] 🔵 Refactor [specific behavior] if needed (keep passing)

Example:
- [ ] 🔴 Write unit test for email format validation (expect fail)
- [ ] 🟢 Implement email format validation (expect pass)
- [ ] 🔵 Refactor email validation if needed (keep passing)
- [ ] 🔴 Write unit test for password strength check (expect fail)
- [ ] 🟢 Implement password strength check (expect pass)
- [ ] 🔵 Refactor password strength check if needed (keep passing)

---

## Appendix: Code Examples

Reference existing codebase patterns when available:
- "See `src/services/auth.service.ts:45` for service method pattern"
- "See `src/schemas/user.schema.ts` for Zod validation pattern"

When no existing pattern exists, provide a minimal snippet:

### Example A: [Pattern Name]
```typescript
// Minimal code snippet showing the pattern
```

---

**Format Requirements:**
- Use markdown checkboxes `- [ ]` for all tasks
- Use TDD indicators: 🔴 (red/test), 🟢 (green/implement), 🔵 (refactor)
- Include explicit expectations: (expect fail), (expect pass), (keep passing)
- Keep tasks atomic - one test, one implementation, one refactor
- Include file paths in Context section, not in every task
- Phases should be ordered logically (no separate "Implementation Order" section needed)

**TDD Discipline:**
- 🔴 Red: Write a failing test FIRST. Run it. It should fail. If it passes, investigate why.
- 🟢 Green: Write just enough code to make the test pass. No more.
- 🔵 Refactor: Clean up the code while keeping tests passing.

**Note**: This plan is designed for TDD-focused implementation. Tests define acceptance - when all tests pass, the phase is complete.
