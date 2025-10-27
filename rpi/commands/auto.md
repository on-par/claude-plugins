---
name: rpi:auto
description: Fully automated Research → Plan → Implement workflow
argument-hint: [problem statement]
---

Execute a complete Research → Plan → Implement workflow for the following problem:

**Problem Statement:** $ARGUMENTS

# Workflow Overview

This command orchestrates three sequential phases, each handled by specialized agents:
1. **Research Phase**: Parallel web research and codebase analysis
2. **Planning Phase**: Transform research into actionable implementation plan
3. **Implementation Phase**: Execute the plan with intelligent parallelization

# Phase 1: Research

**Objective**: Gather comprehensive context about the problem from both external sources and the existing codebase.

**Instructions**:

1. **Generate Project Name**: Create a short, kebab-case name from the problem statement. Examples:
   - "Add user authentication" → "user-authentication"
   - "Implement real-time notifications with websockets" → "realtime-notifications"
   - "Fix bug in payment processing system" → "fix-payment-bug"

2. **Launch Research Agents in Parallel**: Use a single message with TWO Task tool calls to launch both agents simultaneously:

   **Agent 1: web-research-specialist**
   - Task: Research best practices, libraries, and solutions for: $ARGUMENTS
   - Expected output: Recommended approaches, relevant libraries/frameworks, best practices, code examples, documentation links

   **Agent 2: codebase-solution-researcher**
   - Task: Analyze how to solve the following problem using the existing codebase: $ARGUMENTS
   - Expected output: Affected files, existing patterns, architecture considerations, dependencies, integration challenges

3. **Wait for Completion**: Both agents must complete before proceeding.

4. **Synthesize Research Document**: Create `./rpi/SHORT_NAME/research.md` with the following structure:

```markdown
# Research: [Problem Title]

## 1. Problem Overview
- Clear problem statement
- Key objectives
- Success criteria

## 2. Web Research Findings
[Synthesize web-research-specialist output]
- Recommended approaches and patterns
- Relevant libraries/frameworks/tools
- Best practices
- Code examples from documentation
- Links to relevant resources

## 3. Codebase Analysis
[Synthesize codebase-solution-researcher output]
- Affected files (with file paths and line numbers where relevant)
- Existing patterns to follow
- Current architecture considerations
- Dependencies and imports needed
- Potential integration challenges

## 4. Proposed Solution Approach
- High-level solution strategy
- Key implementation steps
- Technology/library choices with justification
- Risk factors and mitigations

## 5. Example Code Snippets
- Relevant code examples adapted to the codebase
- Integration points with existing code

## 6. Next Steps
- Prerequisites that must be in place
- Recommended implementation order
- Testing considerations
```

5. **Report Phase Completion**: Confirm research.md has been created at `./rpi/SHORT_NAME/research.md`

# Phase 2: Planning

**Objective**: Transform research findings into a structured, executable implementation plan.

**Instructions**:

1. **Read Research Document**: Use the Read tool to load `./rpi/SHORT_NAME/research.md`

2. **Launch Planning Agent**: Use the Task tool to launch the software-task-planner agent with:
   - Full research document content
   - Problem statement
   - Proposed solution approach
   - Codebase analysis results
   - Recommended libraries and tools

3. **Wait for Completion**: The software-task-planner agent will generate a comprehensive plan.

4. **Save Plan Document**: Create `./rpi/SHORT_NAME/plan.md` with the planner's output. The plan must include:
   - Problem summary
   - Prerequisites
   - Implementation phases with atomic tasks (markdown checkboxes `- [ ]`)
   - Acceptance criteria for each phase
   - Testing strategy
   - Risk mitigation

5. **Report Phase Completion**: Confirm plan.md has been created at `./rpi/SHORT_NAME/plan.md`

# Phase 3: Implementation

**Objective**: Execute all tasks from the plan with maximum efficiency through intelligent parallelization.

**Instructions**:

1. **Read Plan Document**: Use the Read tool to load `./rpi/SHORT_NAME/plan.md`

2. **Analyze Plan Structure**:
   - Identify all phases and their tasks
   - Determine task dependencies (based on file references, explicit dependencies, or logical ordering)
   - Identify which tasks within a phase can be parallelized (independent tasks with no shared file modifications)
   - Check for any prerequisites that must be completed first

3. **Process Prerequisites**: If the plan has a Prerequisites section:
   - Complete all prerequisite items first (install dependencies, setup environment, etc.)
   - Verify prerequisites are satisfied before continuing

4. **Implement Phases Sequentially**: For each phase in order:

   **a. Analyze Phase Tasks**: Within the current phase:
   - Identify independent tasks (can run in parallel)
   - Identify dependent tasks (must run sequentially)
   - Group tasks into parallel batches where safe

   **b. Execute Task Batches**:

   **For Parallel Tasks**: Launch multiple task-implementer agents in parallel using a single message with multiple Task tool calls:
   - Each agent gets its specific task from the plan
   - Each agent receives the full phase context and research document path
   - **CRITICAL**: Each agent must use TodoWrite to create its own task-specific todo list
   - Each agent tracks sub-tasks with TodoWrite (pending → in_progress → completed)
   - Wait for all parallel agents to complete
   - Update plan.md, changing all completed tasks from `- [ ]` to `- [x]` in a single Edit operation

   **For Sequential Tasks**: Launch task-implementer agents one at a time:
   - Provide task and all context
   - **CRITICAL**: Agent must use TodoWrite for task breakdown
   - Agent tracks progress with TodoWrite
   - Update plan.md after each completion (`- [ ]` → `- [x]`)
   - Move to next task

   **c. Phase Verification**: After all phase tasks complete:
   - Verify phase acceptance criteria
   - Run phase-level tests if specified
   - Report phase completion

5. **Final Verification**: After all phases complete:
   - Run full test suite
   - Verify all acceptance criteria met
   - Check that all tasks are marked `- [x]`
   - Generate completion report

6. **Report Implementation Status**: Provide comprehensive summary:
   - Total phases completed
   - Total tasks implemented
   - How many tasks were parallelized
   - All file changes made
   - Test results
   - Any warnings or issues encountered

# Parallelization Strategy

**Tasks can be parallelized when:**
- They modify different files
- They have no explicit dependencies on each other
- They are in the same phase
- They don't share state or resources

**Tasks must be sequential when:**
- One task's output is needed by another
- They modify the same files
- There are explicit dependencies noted in the plan
- They are in different phases

# Error Handling

**If any phase fails:**
- Complete any parallel tasks still in progress
- Mark all successfully completed tasks as `- [x]`
- Stop further phase/task execution
- Report which phase/task failed and why
- Provide the current state and suggest recovery steps
- DO NOT proceed to next phases

**If a task fails during implementation:**
- Complete other parallel tasks in the same batch
- Update plan.md with completed tasks
- Stop execution and report failure
- Preserve all completed work
- Provide recovery guidance

# Quality Gates

**Before marking a task complete:**
- All code changes implemented
- Tests written and passing
- No new errors or warnings
- Acceptance criteria met
- TodoWrite checklist fully completed by the agent

**Before marking a phase complete:**
- All phase tasks marked `- [x]`
- Phase acceptance criteria verified
- Phase-level tests passing

**Before marking implementation complete:**
- All phases complete
- Full test suite passing
- All acceptance criteria met
- Build succeeds without errors

# Progress Tracking

Throughout the workflow:
- Each sub-agent uses TodoWrite to track granular progress
- Main workflow reports phase transitions
- Plan.md checkboxes show overall implementation status
- Users can check `./rpi/SHORT_NAME/plan.md` at any time to see progress

---

**Note**: This is a fully automated workflow that takes a problem statement from initial research all the way through to working implementation. Each phase builds on the previous, with specialized agents handling research, planning, and implementation. The workflow maximizes efficiency through parallel execution while maintaining correctness through careful dependency analysis.
