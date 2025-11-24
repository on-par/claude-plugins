---
name: utensils:find-and-replace
description: Search and replace across files using the Unix-philosophy pipeline
argument-hint: [search pattern] → [replacement]
---

Search and replace across the codebase using a pipeline of minimal, single-purpose agents.

**Arguments:** $ARGUMENTS

Parse the arguments to extract:
- **Search pattern:** What to find (text, regex, or symbol name)
- **Replacement:** What to replace it with

# Pipeline Overview

```
searcher → reader → writer → runner
   │          │        │        │
   └─ Find    └─ Preview └─ Replace └─ Verify
```

Each agent does ONE thing, then hands off to the next.

# Step 1: Find Occurrences (searcher)

Use the **utensils:searcher** agent to locate all occurrences.

**Prompt the searcher with:**
- The search pattern from $ARGUMENTS
- File type filters if applicable (e.g., only `.ts` files)

**Example:** "Find all occurrences of [search pattern] in the codebase"

**The searcher will:**
- Use Grep to find content matches
- Use Glob if searching by file pattern
- Return list of files and line numbers with matches

**Output needed:**
- List of files containing the pattern
- Number of occurrences per file
- Total occurrences

If no occurrences found, report to user and stop.

# Step 2: Preview Changes (reader)

Use the **utensils:reader** agent to show context around each match.

**Prompt the reader with:**
- Each file path from Step 1
- Ask for the lines containing matches with surrounding context

**Purpose:** Let the user (or you) verify these are the right matches before replacing.

**Report to user:**
- Each occurrence with context
- Confirm these should all be replaced
- Note any that might need different handling

# Step 3: Make Replacements (writer)

Use the **utensils:writer** agent to perform the replacements.

**Prompt the writer with:**
- Each file path
- The exact old text to replace
- The exact new text to use
- Whether to replace all occurrences (`replace_all: true`)

**The writer will:**
- Edit each file using the Edit tool
- Report what was changed

**Important:** The writer cannot read files first - it receives the exact strings to replace from the reader's output.

**Process each file:**
1. Use Edit with the old string and new string
2. Verify the edit succeeded
3. Move to next file

# Step 4: Verify (runner)

Use the **utensils:runner** agent to verify the changes didn't break anything.

**Prompt the runner with:**
- Build command (e.g., `npm run build`, `tsc`, `go build`)
- Test command (e.g., `npm test`, `pytest`)

**The runner will:**
- Execute build to check for compile errors
- Execute tests to check for regressions

**If build/tests fail:** Report which files may need manual attention.

# Completion

Report to the user:
- Files modified: [count]
- Occurrences replaced: [count]
- Build status: [pass/fail]
- Test status: [pass/fail]
- List of all files changed

# Safety Checks

Before replacing, consider:
- **Scope:** Is this replacing in the right files only?
- **Context:** Are all matches the right kind of match? (e.g., not in comments or strings)
- **Imports:** Will this break import statements?
- **Types:** Will this affect type definitions?

# Example Usage

**Rename a function:**
```
/utensils:find-and-replace getUserData → fetchUserProfile
```

**Update an import path:**
```
/utensils:find-and-replace @/old-utils → @/new-utils
```

**Replace a deprecated API:**
```
/utensils:find-and-replace .substr( → .substring(
```

# Why This Pipeline?

Each agent has strict constraints:
- **searcher** finds matches but can't read full context
- **reader** reads context but can't modify
- **writer** modifies but can't search or verify
- **runner** verifies but can't modify

This ensures:
1. You see what will change before it changes
2. Each step is auditable
3. Verification happens after changes
4. No accidental modifications during search
