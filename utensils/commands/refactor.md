---
name: utensils:refactor
description: Safely refactor code using the Unix-philosophy pipeline
argument-hint: [file path or description of code to refactor]
---

Safely refactor code using a pipeline of minimal, single-purpose agents.

**Target:** $ARGUMENTS

# Pipeline Overview

```
searcher → reader → refactorer → linter → runner
   │          │          │          │         │
   └─ Find    └─ Read    └─ Edit    └─ Check  └─ Test
```

Each agent does ONE thing, then hands off to the next.

# Step 1: Locate (searcher)

Use the **utensils:searcher** agent to find the target file(s).

**Prompt the searcher with:**
- The file path or pattern from $ARGUMENTS
- Ask it to return matching file paths

**Example:** "Find files matching: $ARGUMENTS"

If no files found, report to user and stop.

# Step 2: Understand (reader)

Use the **utensils:reader** agent to read each target file.

**Prompt the reader with:**
- Each file path from Step 1
- Ask it to return file contents and summarize the code structure

**Goal:** Understand current code before making changes.

# Step 3: Refactor (refactorer)

Use the **utensils:refactorer** agent to make improvements.

**Prompt the refactorer with:**
- The file path and current contents
- Specific refactoring goals (extract functions, reduce duplication, improve naming, etc.)
- Any patterns to follow from the codebase

**The refactorer will:**
- Read the code
- Make targeted edits
- Report what was changed

**Important:** The refactorer can only Read and Edit. It cannot create new files or run tests.

# Step 4: Verify Quality (linter)

Use the **utensils:linter** agent to check code quality.

**Prompt the linter with:**
- The file path(s) that were refactored
- Ask it to run the project's linter (eslint, pylint, etc.)

**The linter will:**
- Run static analysis
- Report any issues found

**If issues found:** Consider returning to Step 3 for fixes.

# Step 5: Verify Behavior (runner)

Use the **utensils:runner** agent to run tests.

**Prompt the runner with:**
- Command to run tests (npm test, pytest, etc.)
- Focus on tests related to the refactored code if possible

**The runner will:**
- Execute the test command
- Report pass/fail results

**If tests fail:** Return to Step 3 to fix the refactoring.

# Completion

Report to the user:
- Files refactored
- Changes made
- Lint status
- Test results

# Error Handling

- **No files found (Step 1):** Stop and report to user
- **Lint errors (Step 4):** Return to refactorer or report for manual fix
- **Test failures (Step 5):** Return to refactorer to fix regression

# Why This Pipeline?

Each agent has strict constraints:
- **searcher** can only find, not read
- **reader** can only read, not modify
- **refactorer** can only read/edit, not run commands
- **linter** can only run commands, not edit files
- **runner** can only run commands, not edit files

This separation ensures:
1. Clear audit trail of what each step did
2. No accidental side effects
3. Easy debugging if something goes wrong
4. Forced deliberate handoffs between operations
