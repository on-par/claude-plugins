---
name: utensils:lint-fix
description: Find and fix lint issues using the Unix-philosophy pipeline
argument-hint: [optional: file path or directory]
---

Find and fix lint/style issues using a pipeline of minimal, single-purpose agents.

**Target:** $ARGUMENTS (defaults to entire project if not specified)

# Pipeline Overview

```
linter → reader → writer → linter (verify)
   │        │        │         │
   └─ Find  └─ Read  └─ Fix    └─ Confirm
```

Each agent does ONE thing, then hands off to the next.

# Step 1: Identify Issues (linter)

Use the **utensils:linter** agent to find all lint issues.

**Prompt the linter with:**
- Run the project's linter on $ARGUMENTS (or entire project)
- Common commands:
  - `npm run lint` / `npx eslint .`
  - `pylint src/` / `ruff check .`
  - `go vet ./...` / `golangci-lint run`

**The linter will:**
- Run the lint command
- Return list of issues with file paths and line numbers

**Parse the output to get:**
- File path
- Line number
- Rule/error code
- Error message

If no issues found, report success and stop.

# Step 2: Understand Issues (reader)

Use the **utensils:reader** agent to read the problematic code.

**For each file with issues, prompt the reader with:**
- The file path
- Ask it to return the code around the problem lines

**Goal:** Understand the context to make correct fixes.

**Group issues by file** to minimize read operations.

# Step 3: Fix Issues (writer)

Use the **utensils:writer** agent to fix each issue.

**For each issue, prompt the writer with:**
- File path
- The old code (exact string from reader)
- The fixed code (corrected version)

**Common fix patterns:**

| Issue Type | Fix |
|------------|-----|
| Unused variable | Remove or prefix with `_` |
| Missing semicolon | Add semicolon |
| Inconsistent quotes | Standardize quote style |
| Trailing whitespace | Remove whitespace |
| Missing return type | Add type annotation |
| Unused import | Remove import line |
| Console.log | Remove or convert to proper logging |

**Important:** The writer cannot read files - it must receive exact old/new strings.

# Step 4: Verify Fixes (linter)

Use the **utensils:linter** agent again to confirm fixes worked.

**Prompt the linter with:**
- Same lint command as Step 1
- Focus on the files that were modified

**Expected:** Zero issues (or fewer than before)

**If issues remain:**
- Some may be auto-fixable issues that weren't fixed
- Some may be new issues introduced by fixes
- Return to Step 2 for remaining issues

# Iteration Strategy

Some lint issues may require multiple passes:

**Pass 1:** Fix obvious issues (unused vars, formatting)
**Pass 2:** Fix issues revealed after Pass 1 (type errors from removed code)
**Pass 3:** Fix any remaining edge cases

Limit to 3 passes. If issues persist, report remaining issues for manual review.

# Auto-Fix Alternative

Many linters have auto-fix capabilities. If available, prefer using them:

**Step 1 (alternative):** Use **runner** agent to run auto-fix:
- `npm run lint -- --fix`
- `eslint . --fix`
- `ruff check . --fix`
- `go fmt ./...`

**Step 2:** Use **linter** to check what remains after auto-fix

**Step 3-4:** Use the manual pipeline for remaining issues

# Completion

Report to the user:
- Initial issue count: [number]
- Issues fixed: [number]
- Issues remaining: [number] (with details)
- Files modified: [list]

# Why This Pipeline?

Each agent has strict constraints:
- **linter** can only run commands, finds issues but can't fix them
- **reader** can only read, provides context but can't modify
- **writer** can only write/edit, fixes but can't verify
- **linter** (again) verifies the fixes worked

This ensures:
1. Issues are identified before any changes
2. Context is gathered before fixing
3. Fixes are verified after applying
4. Clear audit trail of what was changed and why

# Common Lint Rules Reference

**ESLint/TypeScript:**
- `no-unused-vars` - Remove or use the variable
- `@typescript-eslint/no-explicit-any` - Add proper types
- `prefer-const` - Change `let` to `const`
- `eqeqeq` - Use `===` instead of `==`

**Python (Pylint/Ruff):**
- `W0612` unused-variable - Remove or prefix with `_`
- `W0611` unused-import - Remove import
- `C0114` missing-module-docstring - Add docstring
- `E501` line-too-long - Break into multiple lines

**Go:**
- `declared but not used` - Remove or use the variable
- `imported but not used` - Remove import
- `should use ... instead of ...` - Use recommended pattern
