---
name: rpi:implement
description: Implement the entire plan with intelligent parallelization
argument-hint: [path to plan.md]
---

Implement all phases and tasks from the plan with intelligent parallelization where possible.

**Plan Document Path:** $ARGUMENTS

# Implementation Instructions

1. **Read the Plan Document**: Use the Read tool to load the complete plan from the provided path.

2. **Analyze Plan Structure**:
   - Identify all phases and their tasks
   - Determine task dependencies (based on file references, explicit dependencies, or logical ordering)
   - Identify which tasks within a phase can be parallelized (independent tasks with no shared file modifications)
   - Check for any prerequisites that must be completed first

3. **Process Prerequisites**: If the plan has a Prerequisites section:
   - Complete all prerequisite items first (install dependencies, setup environment, etc.)
   - Verify prerequisites are satisfied before continuing

4. **Implement Phases Sequentially**: For each phase in order:

   a. **Analyze Phase Tasks**: Within the current phase:
      - Identify independent tasks (can run in parallel)
      - Identify dependent tasks (must run sequentially)
      - Group tasks into parallel batches where safe

   b. **Execute Task Batches**:

      **For Parallel Tasks**: Launch multiple task-implementer agents in parallel using a single message with multiple Task tool calls:
      - Each agent gets its specific task
      - Each agent receives phase and research context
      - **CRITICAL**: Each agent must use TodoWrite to create its own task-specific todo list
      - Each agent tracks sub-tasks with TodoWrite (in_progress → completed)
      - Wait for all parallel agents to complete
      - Update plan.md, changing all completed tasks from `- [ ]` to `- [x]` in a single Edit operation

      **For Sequential Tasks**: Launch task-implementer agents one at a time:
      - Provide task and all context
      - **CRITICAL**: Agent must use TodoWrite for task breakdown
      - Agent tracks progress with TodoWrite
      - Update plan.md after each completion (`- [ ]` → `- [x]`)
      - Move to next task

   c. **Phase Verification**: After all phase tasks complete:
      - Verify phase acceptance criteria
      - Run phase-level tests
      - Report phase completion

5. **Final Verification**: After all phases complete:
   - Run full test suite
   - Verify all acceptance criteria met
   - Check that all tasks are marked `- [x]`
   - Generate completion report

6. **Report Status**: Provide comprehensive summary:
   - Total phases completed
   - Total tasks implemented
   - How many tasks were parallelized
   - All file changes made
   - Test results
   - Any warnings or issues encountered

# Parallelization Strategy

Tasks can be parallelized when:
- They modify different files
- They have no explicit dependencies on each other
- They are in the same phase
- They don't share state or resources

Tasks must be sequential when:
- One task's output is needed by another
- They modify the same files
- There are explicit dependencies noted in the plan
- They are in different phases

# Error Handling

If any task fails:
- Complete any parallel tasks still in progress
- Mark all successfully completed tasks as `- [x]`
- Stop further phase/task execution
- Report which task failed and why
- Provide the current state and suggest recovery steps

# Quality Gates

Before marking a task complete:
- All code changes implemented
- Tests written and passing
- No new errors or warnings
- Acceptance criteria met
- TodoWrite checklist fully completed by the agent

**Note**: This command orchestrates the entire implementation, maximizing efficiency through parallelization while maintaining correctness through careful dependency analysis. Each sub-agent uses TodoWrite to maintain focus and track granular progress.
