---
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

# Plan Output Requirements

The `plan.md` file must include:

## Problem Summary
- Brief overview of what is being implemented
- Link or reference to the research document

## Prerequisites
- Required dependencies or tools to install
- Environment setup needed
- Any blocking issues that must be resolved first

## Implementation Phases

Break down the work into logical phases. Each phase should contain:

### Phase N: [Phase Name]
**Goal:** What this phase accomplishes

**Tasks:**
- [ ] Specific, atomic task (file:line reference where applicable)
- [ ] Another specific task
- [ ] etc.

**Acceptance Criteria:**
- How to verify this phase is complete
- Any tests that should pass

## Implementation Order

Specify the recommended order for executing phases and any dependencies between phases.

## Testing Strategy

- Unit tests to write
- Integration tests needed
- Manual testing steps

## Risk Mitigation

- Potential blockers identified
- Contingency approaches
- Known edge cases to handle

---

**Format Requirements:**
- Use markdown checkboxes `- [ ]` for all tasks
- Include file paths and line numbers where specific code changes are needed
- Keep tasks atomic (completable in one focused session)
- Ensure tasks are ordered logically with clear dependencies
- Make acceptance criteria measurable and specific

**Note**: This plan is designed to be consumed by an implementation agent or developer. Each task should be clear enough to execute without requiring the full research context.
