---
name: product-team:check-pr
description: Examine a PR comments/failed checks and create a plan to address issues
argument-hint: [PR #] or empty for current branch
---

You are analyzing a pull request with the product team to identify and resolve issues. This command examines PR comments from reviewers, failed CI/CD checks, and any other blockers, then creates and executes a plan to get the PR ready for merge.

**Pull Request:** $ARGUMENTS

# PR Analysis and Resolution Process

This command helps you systematically address PR feedback and failed checks to get your work ready for merge. It combines code review feedback, test failures, and quality checks into an actionable remediation plan.

## Process Overview

```
1. Gather PR Context (GitHub CLI)
   ↓
2. Analyze Comments & Failed Checks (Tech Lead + QA)
   ↓
3. Create Remediation Plan (Tech Lead)
   ↓
4. Execute Fixes (Engineers)
   ↓
5. Verify Resolution (QA + Tech Lead)
   ↓
6. ✅ PR Ready for Merge!
```

## Phase 1: Gather PR Context

Use GitHub CLI to gather comprehensive PR information.

### Determine Which PR to Analyze

**If $ARGUMENTS is empty or not a number:**
- Get the current branch name: `git branch --show-current`
- Find the PR for this branch: `gh pr list --head <branch-name> --json number,title,state`
- If no PR found, inform user and exit
- If PR found, use that PR number

**If $ARGUMENTS is a number:**
- Use the provided PR number directly

### Collect PR Information

Once you have the PR number, gather:

1. **PR Details:**
   ```bash
   gh pr view <PR-NUMBER> --json number,title,body,state,isDraft,author,baseRefName,headRefName,url,additions,deletions,changedFiles
   ```

2. **PR Comments:**
   ```bash
   gh pr view <PR-NUMBER> --json comments
   ```

3. **Review Comments:**
   ```bash
   gh api repos/:owner/:repo/pulls/<PR-NUMBER>/comments
   ```

4. **PR Checks:**
   ```bash
   gh pr checks <PR-NUMBER>
   ```

5. **PR Diff:**
   ```bash
   gh pr diff <PR-NUMBER>
   ```

### Information to Extract

From the gathered data, identify:
- **Review Comments:** Feedback from reviewers (code suggestions, concerns, questions)
- **Failed Checks:** Which CI/CD checks failed and why
- **Change Requests:** Explicit requests for changes
- **Questions:** Questions that need answers or clarification
- **Code Suggestions:** Specific code improvements suggested
- **Test Failures:** Which tests are failing and error messages
- **Linting Errors:** Code style or quality issues
- **Security Issues:** Security scanning failures
- **Coverage Issues:** Test coverage below threshold

## Phase 2: Analyze Issues (Tech Lead + QA)

Use the **tech-lead** and **qa-engineer** agents in parallel to analyze the identified issues.

### Tech Lead Analysis

Launch **tech-lead** agent to:
- Categorize all issues by type and severity
- Identify which issues are blocking vs. nice-to-have
- Assess technical complexity of each fix
- Identify dependencies between issues
- Recommend resolution approach for each issue
- Prioritize fixes (critical blockers first)

**Tech Lead Should Consider:**
- Are review comments valid concerns?
- Which failed checks are critical?
- Are there security or performance issues?
- Is there technical debt to address?
- What's the quickest path to green checks?

### QA Analysis

Launch **qa-engineer** agent to:
- Analyze test failures in detail
- Identify missing test coverage
- Assess quality of proposed changes
- Verify edge cases are considered
- Review coverage reports
- Identify quality risks

**QA Should Consider:**
- Why are tests failing?
- Are there legitimate bugs found?
- Is test coverage adequate?
- Are edge cases handled?
- What quality gates are not met?

## Phase 3: Create Remediation Plan (Tech Lead)

Use the **tech-lead** agent to create a structured remediation plan.

### Plan Structure

The plan should include:

1. **Issue Summary:**
   - Total issues found: X
   - Critical blockers: X
   - Review comments: X
   - Failed checks: X
   - Test failures: X

2. **Prioritized Fix List:**
   Each fix should include:
   - **Issue:** Brief description
   - **Type:** Review comment / Failed check / Test failure / etc.
   - **Severity:** Critical / High / Medium / Low
   - **Location:** File:line or check name
   - **Required Action:** What needs to be done
   - **Estimated Complexity:** Simple / Medium / Complex
   - **Owner:** Backend / Frontend / Both

3. **Execution Order:**
   List fixes in the order they should be addressed:
   - Fix critical blockers first
   - Group related fixes together
   - Fix dependencies before dependents
   - Address test failures before coverage

4. **Testing Strategy:**
   - Which tests to run after each fix
   - How to verify fixes locally
   - How to verify on CI/CD

### Use TodoWrite for the Plan

Create a todo list with each fix as a separate task:
- Use clear, actionable task descriptions
- Mark severity in the task description
- Order by priority (critical first)
- Include file references where applicable

## Phase 4: Execute Fixes (Engineers)

For each task in the plan, use the appropriate engineer agent to implement the fix.

### Determine Which Engineer to Use

**Use backend-engineer for:**
- API changes
- Database modifications
- Server-side logic
- Backend test fixes
- Security issues in backend code

**Use frontend-engineer for:**
- UI component changes
- Client-side logic
- Frontend test fixes
- Accessibility issues
- Styling changes

**Use tech-lead for:**
- Architecture changes
- Refactoring across multiple files
- Complex technical decisions
- Code review responses that need context

### Fix Implementation Guidelines

**For Review Comments:**
1. Read the comment carefully
2. Understand the reviewer's concern
3. Implement the requested change
4. Add a comment explaining the change (if needed)
5. Mark the conversation as resolved (using gh)

**For Failed Tests:**
1. Understand why the test is failing
2. Fix the underlying issue (or update test if appropriate)
3. Run tests locally to verify fix
4. Ensure related tests still pass

**For Linting/Style Issues:**
1. Identify the rule being violated
2. Fix the code to comply
3. Run linter locally to verify

**For Code Suggestions:**
1. Evaluate if suggestion improves code
2. Implement if beneficial
3. Politely decline if not applicable (with reason)

### After Each Fix

1. **Run Relevant Tests:**
   - Execute tests locally
   - Verify fix resolves the issue
   - Ensure no new failures

2. **Update Todo:**
   - Mark the task as completed
   - Move to next task

3. **Commit Changes:**
   - Use clear commit message referencing the issue
   - Example: "Fix test failure in user authentication"
   - Example: "Address review comment: improve error handling"

## Phase 5: Verify Resolution

After all fixes are implemented, verify the PR is ready.

### Local Verification

1. **Run Full Test Suite:**
   ```bash
   # Identify and run the test command
   npm test  # or pytest, or gradle test, etc.
   ```

2. **Run Linter:**
   ```bash
   # Identify and run linting
   npm run lint  # or eslint, or pylint, etc.
   ```

3. **Build Project:**
   ```bash
   # Verify build succeeds
   npm run build  # or gradle build, etc.
   ```

### Push and Verify on CI

1. **Push Changes:**
   ```bash
   git push
   ```

2. **Check CI Status:**
   ```bash
   gh pr checks <PR-NUMBER>
   ```

3. **Monitor for New Failures:**
   - Watch for new check results
   - Address any new failures immediately

### QA Final Verification

Launch **qa-engineer** agent to:
- Review all fixes made
- Verify all issues addressed
- Check for any remaining quality concerns
- Confirm PR meets quality gates
- Give final quality sign-off

### Tech Lead Final Review

Launch **tech-lead** agent to:
- Review all code changes made
- Verify changes follow best practices
- Confirm architecture remains sound
- Check for introduced technical debt
- Give final technical sign-off

## Phase 6: Completion Checklist

Before marking the PR as ready for merge, verify:

- [ ] All review comments addressed or responded to
- [ ] All failed checks now passing
- [ ] All tests passing locally
- [ ] All tests passing on CI/CD
- [ ] Linting passes
- [ ] Build succeeds
- [ ] Coverage meets threshold
- [ ] No new security issues
- [ ] No new performance regressions
- [ ] QA Engineer has approved
- [ ] Tech Lead has approved
- [ ] All conversations resolved
- [ ] PR description updated if needed
- [ ] Ready for final approval and merge

## Output Format

After completing the process, provide a summary:

```markdown
# PR Remediation Summary

**PR Number:** #<number>
**PR Title:** <title>
**Branch:** <head-branch> → <base-branch>
**URL:** <pr-url>

## Initial State

**Issues Found:**
- Review Comments: X
- Failed Checks: X
- Test Failures: X
- Linting Errors: X
- Other Issues: X

**Total Issues:** X

## Issues Addressed

### Critical Blockers (X)
- [✓] <Issue 1> - <Brief description of fix>
- [✓] <Issue 2> - <Brief description of fix>

### Review Comments (X)
- [✓] <Comment 1> - <How addressed>
- [✓] <Comment 2> - <How addressed>

### Failed Checks (X)
- [✓] <Check 1> - <Resolution>
- [✓] <Check 2> - <Resolution>

### Test Failures (X)
- [✓] <Test 1> - <Fix description>
- [✓] <Test 2> - <Fix description>

## Fixes Applied

**Commits Made:** X
- <commit-hash>: <commit message>
- <commit-hash>: <commit message>

**Files Modified:** X
- <file-path>: <change description>
- <file-path>: <change description>

## Verification Results

**Local Testing:**
- [✓] Test suite: All passing
- [✓] Linter: No errors
- [✓] Build: Success

**CI/CD Checks:**
- [✓] <Check 1>: Passing
- [✓] <Check 2>: Passing
- [✓] <Check 3>: Passing

**Quality Gates:**
- [✓] Test coverage: X% (threshold: Y%)
- [✓] Security scan: No issues
- [✓] Code quality: Meets standards

## Sign-Offs

- [✓] QA Engineer: Approved
- [✓] Tech Lead: Approved
- [✓] All conversations resolved: Yes

## Final Status

**PR Status:** ✅ READY FOR MERGE

**Remaining Actions:**
- [ ] Request final review from maintainer
- [ ] Merge when approved

**Notes:**
<Any additional context or information>

---
**Remediated By:** Product Team
**Date:** <current-date>
**Time Spent:** <duration>
```

## Implementation Instructions

### Step-by-Step Execution

1. **Gather PR Context:**
   - Determine PR number (from args or current branch)
   - Collect all PR information using gh CLI
   - Parse and organize the data

2. **Analyze Issues:**
   - Launch tech-lead and qa-engineer agents in parallel
   - Wait for both analyses to complete
   - Synthesize findings

3. **Create Plan:**
   - Launch tech-lead agent to create remediation plan
   - Use TodoWrite to create task list
   - Review and confirm plan

4. **Execute Fixes:**
   - For each task (in priority order):
     - Launch appropriate engineer agent
     - Implement fix
     - Test locally
     - Commit changes
     - Mark task completed
     - Move to next task

5. **Verify Resolution:**
   - Run full test suite
   - Push changes
   - Check CI/CD status
   - Launch qa-engineer for final verification
   - Launch tech-lead for final review

6. **Provide Summary:**
   - Generate remediation summary
   - Display final status
   - Provide next steps

### Agent Usage

**Launch agents strategically:**
- Use Task tool with `subagent_type: "product-team:tech-lead"` for planning and reviews
- Use Task tool with `subagent_type: "product-team:backend-engineer"` for backend fixes
- Use Task tool with `subagent_type: "product-team:frontend-engineer"` for frontend fixes
- Use Task tool with `subagent_type: "product-team:qa-engineer"` for test and quality analysis

**Launch in parallel when possible:**
- Initial analysis: tech-lead + qa-engineer in parallel
- Final verification: qa-engineer + tech-lead in parallel

**Launch sequentially when dependent:**
- Analysis → Planning → Execution → Verification

## Error Handling

**If no PR found for current branch:**
```
❌ No pull request found for branch '<branch-name>'

Please either:
1. Create a PR first: gh pr create
2. Specify a PR number: /product-team:check-pr 123
3. Switch to a branch with an open PR
```

**If PR is already merged:**
```
ℹ️ PR #<number> is already merged.

This command is for analyzing open PRs. The PR was merged on <date>.
```

**If PR is closed (not merged):**
```
⚠️ PR #<number> is closed (not merged).

This command works best with open PRs. Would you like to analyze it anyway?
```

**If no issues found:**
```
✅ PR #<number> looks great!

No issues found:
- All checks passing
- No review comments requiring changes
- All conversations resolved

The PR appears ready for merge. Consider requesting final approval.
```

## Important Notes

- **Don't skip issues:** Address all review comments, even minor ones
- **Test thoroughly:** Run tests after each fix, not just at the end
- **Communicate clearly:** Respond to review comments explaining changes
- **Push incrementally:** Push fixes as you complete them (or batch logically)
- **Re-run checks:** Verify CI/CD after pushing
- **Ask for help:** If a comment is unclear, ask the reviewer for clarification
- **Be respectful:** Accept feedback graciously; reviewers help improve code
- **Focus on quality:** The goal is a better codebase, not just a green checkmark

## Success Criteria

The PR is **successfully remediated** when:

✅ All review comments addressed or responded to
✅ All conversations resolved or clarified
✅ All CI/CD checks passing
✅ All tests passing (100% pass rate)
✅ Linting passes with no errors
✅ Build succeeds
✅ Test coverage meets or exceeds threshold
✅ No security vulnerabilities introduced
✅ QA Engineer has verified quality
✅ Tech Lead has approved technical changes
✅ PR is ready for final maintainer approval

This systematic approach ensures PR feedback is addressed thoroughly and professionally, leading to higher quality code and smoother collaboration with reviewers.
