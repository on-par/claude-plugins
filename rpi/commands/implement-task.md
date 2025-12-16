---
name: rpi:implement-task
description: Implement the next unchecked task from a plan
argument-hint: [path to plan.md]
---

Implement the next available unchecked task from the provided plan document.

**Plan Document Path:** $ARGUMENTS

# Implementation Instructions

1. **Read the Plan Document**: Use the Read tool to load the complete plan from the provided path.

2. **Find Next Task**: Scan through the plan.md file to find the first unchecked task (`- [ ]`).
   - If no unchecked tasks are found, inform the user that all tasks are complete.
   - If an unchecked task is found, proceed with implementation.

3. **Launch Task Implementation Agent**: Analyze the task and select the appropriate specialist agent:

   **Task Classification**:
   - Use `frontend-specialist` for: UI components, styling, client-side interactions, responsive design, accessibility
   - Use `backend-specialist` for: APIs, business logic, database operations, server-side services, authentication
   - Use `test-writer` for: Writing test suites, improving test coverage, adding test cases
   - Use `task-implementer` for: General tasks, mixed concerns, or when task type is unclear

   **Launch Agent** with the Task tool and provide:
   - The specific task to implement
   - All relevant context from the plan (phase goals, acceptance criteria, prerequisites)
   - The full research context if available (check for research.md in the same directory)
   - **CRITICAL**: Instruct the agent to use the TodoWrite tool to create a detailed todo list for breaking down this specific task into sub-steps before beginning implementation
   - The agent should mark sub-tasks as in_progress and completed as it works
   - The agent should only mark its work as done when the task is fully complete with passing tests

4. **Verify Implementation**:
   - Run tests to ensure they pass
   - **If tests fail**: Launch `test-analyzer` agent to diagnose and fix issues
   - **Code Review**: Launch `code-reviewer` agent to review the implementation for:
     * Code quality and maintainability
     * Security vulnerabilities
     * Performance issues
     * Best practices compliance
   - Address any critical issues found

5. **Update Plan Document**: After verification passes:
   - Use the Edit tool to change the completed task from `- [ ]` to `- [x]`
   - Verify the change was applied correctly

6. **Report Status**: Inform the user:
   - Which task was completed
   - What file changes were made
   - Test results
   - Code review findings
   - What the next unchecked task is (if any)

# Task Completion Criteria

A task is only considered complete when:
- All code changes are implemented
- Tests are written and passing
- The implementation matches the acceptance criteria
- No errors or warnings are introduced

# Error Handling

If the task-implementer agent encounters blockers:
- Do NOT mark the task as checked
- Report the blocker to the user
- Suggest next steps or alternatives
- Keep the task unchecked for retry

**Note**: This command focuses on completing ONE task at a time with high quality and proper testing.

- Must not add any documentation unless specified by the plan. Especially not in the rpi subfolder.
- Don't generate one-off test scripts. Testing must be done with existing frameworks (or add frameworks if part of the plan).