---
name: utensils:add-tests
description: Add tests for existing code using the Unix-philosophy pipeline
argument-hint: [file path to add tests for]
---

Add tests for existing code using a pipeline of minimal, single-purpose agents.

**Target:** $ARGUMENTS

# Pipeline Overview

```
searcher → reader → test-writer → runner
   │          │          │           │
   └─ Find    └─ Read    └─ Write    └─ Run
```

Each agent does ONE thing, then hands off to the next.

# Step 1: Locate (searcher)

Use the **utensils:searcher** agent to find the target file and existing test patterns.

**Prompt the searcher with:**
1. Find the target file: $ARGUMENTS
2. Find existing test files to understand the project's test patterns (e.g., `**/*.test.ts`, `**/*.spec.js`, `**/test_*.py`)

**Example:** "Find $ARGUMENTS and any existing test files in the project"

If target file not found, report to user and stop.

# Step 2: Understand (reader)

Use the **utensils:reader** agent to read:

1. **The target file** - understand what needs to be tested
2. **An existing test file** - understand the project's test patterns, frameworks, and conventions

**Prompt the reader with:**
- The file paths from Step 1
- Ask it to summarize:
  - Functions/classes/exports in the target file
  - Test framework used (Jest, Pytest, Mocha, etc.)
  - Test file naming conventions
  - Test structure patterns (describe/it, test classes, etc.)

# Step 3: Write Tests (test-writer)

Use the **utensils:test-writer** agent to create the test file.

**Prompt the test-writer with:**
- The target file path and its contents (from reader)
- The test patterns observed (from reader)
- Where to write the test file (follow project conventions)
- What to test:
  - All exported functions/classes
  - Happy path cases
  - Edge cases (null, empty, boundary values)
  - Error cases

**The test-writer will:**
- Read the target code to understand behavior
- Write a new test file following project conventions

**Important:** The test-writer can only Read and Write. It cannot run tests to verify they work.

# Step 4: Verify (runner)

Use the **utensils:runner** agent to run the new tests.

**Prompt the runner with:**
- Command to run the specific test file
- Or command to run the full test suite

**Example commands:**
- `npm test -- path/to/file.test.ts`
- `pytest path/to/test_file.py`
- `jest path/to/file.test.js`

**The runner will:**
- Execute the test command
- Report pass/fail results

**If tests fail:** Report which tests failed and why. The test-writer may need to be invoked again to fix the tests.

# Completion

Report to the user:
- Test file created at: [path]
- Number of test cases written
- Test results (pass/fail)
- Coverage of target file's exports

# Iteration

If tests fail due to test-writer errors (not implementation bugs):
1. Use **reader** to read the failing test output
2. Use **test-writer** to fix the test file
3. Use **runner** to re-run tests

Repeat until tests pass.

# Test Writing Guidelines

The test-writer should follow these principles:
- **One assertion per test** when practical
- **Descriptive test names** that explain what's being tested
- **Arrange-Act-Assert** pattern
- **Test behavior, not implementation**
- **Cover edge cases:** null, undefined, empty, boundary values
- **Cover error cases:** invalid inputs, thrown exceptions

# Why This Pipeline?

Each agent has strict constraints:
- **searcher** finds files but can't read them
- **reader** reads files but can't modify them
- **test-writer** reads and writes but can't run tests
- **runner** runs commands but can't edit files

This ensures:
1. Tests are written by understanding code, not by running it
2. Clear separation between writing and validation
3. Explicit verification step that tests actually work
