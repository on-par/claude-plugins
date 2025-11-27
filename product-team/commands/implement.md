---
name: product-team:implement
description: Implement a story end-to-end with TDD, code reviews, and product owner approval
argument-hint: [story or feature description]
---

You are orchestrating a complete story implementation using the product team. This command follows a rigorous quality-first approach with Test-Driven Development (TDD), continuous code reviews, and product owner approval before completion.

**Story to Implement:** $ARGUMENTS

# Implementation Process

This is a **quality-gated workflow** where the story cannot be marked complete until:
- ✅ All tests pass (100% pass rate required)
- ✅ All business logic has corresponding tests
- ✅ Tech Lead has approved the code quality
- ✅ Product Owner has approved the deliverable

## Workflow Overview

```
1. Tech Lead: Create Implementation Plan
   ↓
2. Engineers: Implement with TDD (Red → Green → Refactor)
   ↓
3. Tech Lead: Review Code After Each Change
   ↓ (if issues found)
   └──> Back to Step 2
   ↓ (if approved)
4. Run All Tests (must pass 100%)
   ↓ (if tests fail)
   └──> Back to Step 2
   ↓ (if tests pass)
5. Product Owner: Review Deliverable
   ↓ (if changes requested)
   └──> Back to Step 2
   ↓ (if approved)
6. ✅ Complete!
```

## Phase 1: Technical Planning (Tech Lead)

Use the **tech-lead** agent to create a comprehensive implementation plan:

**Planning Deliverables:**
- High-level architecture and design approach
- Component/module breakdown
- Testing strategy (what tests are needed)
- Existing patterns to follow (with file:line references)
- Implementation order and dependencies
- Risk identification and mitigation

**Tech Lead Should Consider:**
- Does this fit our existing architecture?
- What patterns should we follow?
- What are the testability requirements?
- What could go wrong technically?
- Should we refactor anything first?
- What are the security implications?

## Phase 2: Test-Driven Development (Engineers)

Follow strict TDD methodology:

### TDD Cycle: Red → Green → Refactor

**For Each Feature/Requirement:**

1. **RED**: Write a failing test first
   - Use **qa-engineer** agent to help identify test cases and edge cases
   - Write the test before the implementation code
   - Run the test and verify it fails (proving it's testing something new)

2. **GREEN**: Write minimal code to make the test pass
   - Use **backend-engineer** agent for server-side logic, APIs, database operations
   - Use **frontend-engineer** agent for UI components, state management, client-side logic
   - Implement only what's needed to pass the test
   - Run the test and verify it passes

3. **REFACTOR**: Improve the code while keeping tests green
   - Clean up duplication
   - Improve naming and structure
   - Ensure tests still pass after refactoring

### Engineering Guidelines

**Code Quality Standards:**
- **No Comments**: Write self-explanatory code; avoid comments unless absolutely necessary
- **Clean Up Comments**: Remove existing unnecessary comments from code being modified
- **Clean Code**: Every line should have a clear purpose
- **Test-Driven**: Always write tests first (TDD is mandatory)

**Backend Engineer Focus:**
- API endpoint implementation
- Database schema changes and migrations
- Business logic and validation
- Error handling and logging
- Integration with third-party services
- Backend unit and integration tests

**Frontend Engineer Focus:**
- Component implementation (React/Vue/etc)
- State management (Redux/Context/etc)
- User interface and styling
- Responsive behavior
- Accessibility (WCAG 2.1 AA)
- Frontend unit and component tests

**QA Engineer Focus:**
- Test case identification
- Edge case analysis
- Integration test scenarios
- End-to-end test flows
- Quality risk assessment
- Test data preparation

## Phase 3: Continuous Code Review (Tech Lead)

**CRITICAL**: After each implementation change (after completing a TDD cycle), use the **tech-lead** agent to review the code.

**Tech Lead Reviews For:**
- Code quality and maintainability
- Adherence to established patterns
- Absence of unnecessary comments (code should be self-documenting)
- Test coverage and quality
- Security vulnerabilities (SQL injection, XSS, etc.)
- Performance implications
- Error handling
- Documentation needs

**Review Outcomes:**
- ✅ **Approved**: Continue to next feature/requirement
- ⚠️ **Changes Requested**: Engineer fixes issues, then Tech Lead reviews again
- 🚨 **Critical Issues**: Must be fixed before proceeding

**Important**: Do not proceed to the next feature until the Tech Lead approves the current change.

## Phase 4: Test Verification

Before moving to Product Owner review, **ALL tests must pass**.

### Test Execution Strategy

1. **Identify Test Framework**
   - Look for test configuration files (jest.config.js, pytest.ini, etc.)
   - Check package.json or setup files for test scripts

2. **Run All Tests**
   - Execute the full test suite using Bash
   - Parse results to verify 100% pass rate
   - Check for flaky tests

3. **Test Coverage**
   - Verify all business logic has corresponding tests
   - Check coverage reports if available
   - Identify any untested code paths

**Test Failure Protocol:**
- ❌ If ANY tests fail, return to Phase 2
- Debug and fix failing tests
- Have Tech Lead review the fixes
- Re-run tests until 100% pass

**Business Logic Testing Rule:**
- Every piece of business logic MUST have tests
- Controllers, services, utilities, components with logic all need tests
- UI-only components can have lighter testing

## Phase 5: Product Owner Approval

Once all tests pass and code is approved by Tech Lead, use the **product-owner** agent to review the deliverable.

### Deliverable Review Methods

**For Web Applications:**
1. Check if the application can be run locally
2. Use Playwright MCP tools (browser_navigate, browser_snapshot, browser_click, etc.) to interact with the application
3. Product Owner reviews the live application against acceptance criteria
4. Product Owner tests key user flows

**For Non-Web Applications:**
1. Product Owner reviews the code and implementation
2. Reviews test output and coverage
3. Validates acceptance criteria are met through code inspection
4. May request a demo or example usage

### Product Owner Reviews For:
- All acceptance criteria met
- User experience matches expectations
- Edge cases handled appropriately
- Error messages are user-friendly
- Feature works as specified
- No critical or high-severity bugs

**Review Outcomes:**
- ✅ **Approved**: Story is complete!
- 🔄 **Changes Requested**: Return to Phase 2, implement changes, go through review cycles again

## Phase 6: Completion Checklist

Before marking the story as complete, verify:

- [ ] All acceptance criteria met
- [ ] All tests passing (100% pass rate)
- [ ] All business logic has tests
- [ ] Tech Lead has approved code quality
- [ ] No security vulnerabilities introduced
- [ ] Performance is acceptable
- [ ] Error handling is comprehensive
- [ ] Code follows established patterns
- [ ] Documentation updated (if needed)
- [ ] Product Owner has approved the deliverable

# Implementation Instructions

## Step-by-Step Execution

1. **Create Workflow Tracker**
   - Use TodoWrite to create a detailed checklist tracking progress through all phases
   - Update todos as you complete each phase
   - Mark in_progress for current phase, completed for done phases

2. **Launch Agents Strategically**
   - Launch agents when you need their specific expertise
   - Tech Lead: Planning, code reviews, architectural decisions
   - Backend Engineer: Server-side implementation
   - Frontend Engineer: Client-side implementation
   - QA Engineer: Test strategy and edge cases
   - Product Owner: Requirements clarification and final approval

3. **Follow the TDD Cycle Strictly**
   - Never write implementation code before tests
   - Verify tests fail before implementing (RED)
   - Implement minimal code to pass (GREEN)
   - Refactor while keeping tests green (REFACTOR)

4. **Enforce Quality Gates**
   - Tech Lead must approve each change before continuing
   - All tests must pass before Product Owner review
   - Product Owner must approve before completion
   - Loop back when issues are found

5. **Run Tests Frequently**
   - After each GREEN phase
   - After each REFACTOR phase
   - Before requesting Tech Lead review
   - Before Product Owner review

6. **Iterate Until Complete**
   - If Tech Lead requests changes: fix and get re-approval
   - If tests fail: debug, fix, and re-run
   - If Product Owner requests changes: implement and go through full review cycle
   - Only complete when all quality gates pass

## Agent Usage Patterns

**Use Task tool with appropriate subagent_type:**
- `subagent_type: "product-team:tech-lead"` - For planning, architecture, code review
- `subagent_type: "product-team:backend-engineer"` - For backend implementation
- `subagent_type: "product-team:frontend-engineer"` - For frontend implementation
- `subagent_type: "product-team:qa-engineer"` - For test strategy and edge cases
- `subagent_type: "product-team:product-owner"` - For requirements and approval

**Launch agents in sequence, not parallel** (each phase depends on previous):
- Phase 1: Launch tech-lead for planning
- Phase 2: Launch appropriate engineer(s) and qa-engineer for TDD
- Phase 3: Launch tech-lead for code review
- Phase 5: Launch product-owner for approval

## Example Workflow

```
1. Use TodoWrite to create phase checklist
2. Launch tech-lead to create implementation plan
3. Review plan and prepare for TDD
4. Launch qa-engineer to identify first test case
5. Launch backend-engineer to write test (RED)
6. Run test, verify it fails
7. Launch backend-engineer to implement code (GREEN)
8. Run test, verify it passes
9. Launch tech-lead to review the change
10. If approved, move to next test case (repeat 4-9)
11. If changes requested, fix and get re-approval
12. Once all features implemented and tests passing, launch product-owner
13. If product-owner approves, mark story complete!
14. If product-owner requests changes, implement and repeat review cycle
```

# Success Criteria

The story is **successfully complete** when:

✅ All acceptance criteria from the Product Owner are met
✅ All tests pass with 100% success rate
✅ All business logic is covered by tests
✅ Tech Lead has approved the final code quality
✅ No security vulnerabilities present
✅ Product Owner has approved the deliverable
✅ Code follows established patterns and standards
✅ Error handling is comprehensive
✅ Documentation is updated (if applicable)

# Important Notes

- **Never skip tests**: Every feature must have tests written first (TDD)
- **Never skip reviews**: Tech Lead must review each change
- **Never skip quality gates**: All tests must pass before Product Owner review
- **Never complete without approval**: Product Owner must explicitly approve
- **Never ignore failing tests**: 100% pass rate is mandatory
- **Be iterative**: Expect multiple review cycles; this is normal and healthy
- **Stay focused**: Complete one TDD cycle at a time
- **Communicate progress**: Keep todos updated so progress is visible

This rigorous process ensures we ship high-quality, well-tested, user-approved features every time. Take your time, follow the process, and deliver excellence.
