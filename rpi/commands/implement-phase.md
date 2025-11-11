---
name: rpi:implement-phase
description: Implement all tasks in the next unchecked phase
argument-hint: [path to plan.md]
---

Implement all tasks in the next phase that has unchecked tasks.

**Plan Document Path:** $ARGUMENTS

# Implementation Instructions

1. **Read the Plan Document**: Use the Read tool to load the complete plan from the provided path.

2. **Identify Next Phase**: Scan through the plan.md file to find the first phase that contains unchecked tasks (`- [ ]`).
   - If no unchecked tasks are found in any phase, inform the user that all phases are complete.
   - If a phase with unchecked tasks is found, proceed with that phase.

3. **Implement Phase Tasks Sequentially**: For each unchecked task in the identified phase:

   a. **Launch Task Implementation Agent**: Analyze the task and select the appropriate specialist agent:

      **Task Classification**:
      - Use `frontend-specialist` for: UI components, styling, client-side interactions, responsive design, accessibility
      - Use `backend-specialist` for: APIs, business logic, database operations, server-side services, authentication
      - Use `test-writer` for: Writing test suites, improving test coverage, adding test cases
      - Use `task-implementer` for: General tasks, mixed concerns, or when task type is unclear

      **Launch Agent** with the Task tool and provide:
      - The specific task to implement
      - Phase context (phase goal, acceptance criteria)
      - Full research context if available (check for research.md in same directory)
      - **CRITICAL**: Instruct the agent to use TodoWrite tool to create a detailed sub-task breakdown before implementation
      - The agent must track progress with TodoWrite, marking sub-tasks as in_progress and completed
      - The agent should only finish when the task is fully complete with passing tests

   b. **Update Plan**: After successful completion, use Edit tool to change `- [ ]` to `- [x]` for that task

   c. **Verify and Continue**: Check if tests pass and move to next unchecked task in the phase

4. **Phase Completion Verification**: After all tasks in the phase are checked:
   - Run any phase-level acceptance criteria tests
   - **If tests fail**: Launch `test-analyzer` agent to diagnose failures and recommend fixes
   - **Code Review**: Launch `code-reviewer` agent to review all phase changes for:
     * Code quality and maintainability
     * Security vulnerabilities
     * Performance issues
     * Best practices compliance
   - Address any critical issues found by the code reviewer
   - Verify all phase goals are met
   - Report phase completion status

5. **Report Status**: Inform the user:
   - Which phase was completed
   - How many tasks were implemented
   - Summary of file changes
   - Test results
   - Code review findings (critical/major/minor issues)
   - What the next phase is (if any)

# Phase Completion Criteria

A phase is only considered complete when:
- All tasks in the phase are checked off
- Phase acceptance criteria are met
- All tests are passing
- No errors or warnings are introduced

# Error Handling

If any task fails:
- Stop phase implementation
- Do NOT mark the failed task as checked
- Report the blocker to the user
- Mark all completed tasks up to that point as checked
- Suggest next steps

**Note**: This command implements an entire phase sequentially, ensuring each task is complete before moving to the next.
