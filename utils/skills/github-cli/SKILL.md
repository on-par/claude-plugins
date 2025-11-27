---
name: github-cli
description: GitHub CLI (gh) operations for issues, PRs, and repository management. Use when users ask to get, view, review, create, or manage GitHub issues, pull requests, releases, or repository information. Triggers on phrases like "Get Issue #", "Review PR #", "Create PR", "List issues", "Check PR status", "Merge PR", or any GitHub/repo management task.
---

# GitHub CLI Skill

Use the `gh` CLI for all GitHub operations.

## Quick Reference

### Issues

```bash
# View issue
gh issue view <number>

# List issues
gh issue list
gh issue list --state open --label "bug"
gh issue list --assignee @me

# Create issue
gh issue create --title "Title" --body "Description"

# Close/reopen
gh issue close <number>
gh issue reopen <number>

# Add comment
gh issue comment <number> --body "Comment text"
```

### Pull Requests

```bash
# View PR
gh pr view <number>

# View PR with diff
gh pr diff <number>

# List PRs
gh pr list
gh pr list --state open --author @me

# Review PR
gh pr review <number> --approve
gh pr review <number> --request-changes --body "Changes needed"
gh pr review <number> --comment --body "Looks good"

# Check PR status (CI, reviews)
gh pr checks <number>
gh pr status

# Create PR
gh pr create --title "Title" --body "Description"
gh pr create --fill  # Auto-fill from commits

# Merge PR
gh pr merge <number>
gh pr merge <number> --squash
gh pr merge <number> --rebase

# Checkout PR locally
gh pr checkout <number>

# View PR comments
gh api repos/{owner}/{repo}/pulls/<number>/comments
```

### Repository

```bash
# View repo info
gh repo view

# Clone repo
gh repo clone owner/repo

# List releases
gh release list

# View release
gh release view <tag>
```

### API Access

For operations not covered by commands:

```bash
# Generic API call
gh api repos/{owner}/{repo}/issues/<number>
gh api repos/{owner}/{repo}/pulls/<number>/reviews

# With JSON output
gh api repos/{owner}/{repo}/issues --jq '.[].title'
```

## Common Workflows

### Get Issue Details
When user says "Get Issue #123":
1. Run `gh issue view 123`
2. Summarize: title, state, author, labels, body

### Review a PR
When user says "Review PR #456":
1. Run `gh pr view 456` for overview
2. Run `gh pr diff 456` to see changes
3. Run `gh pr checks 456` for CI status
4. Provide summary with recommendation

### Check PR Status
When user says "Check PR #789":
1. Run `gh pr view 789` for state
2. Run `gh pr checks 789` for CI/CD
3. Report: state, reviews, check status

### Create Issue from Discussion
When user describes a bug or feature:
1. Confirm title and description with user
2. Run `gh issue create --title "..." --body "..."`
3. Report issue number and URL

## Output Formatting

Present GitHub data clearly:
- **Issues**: Show #number, title, state, labels, assignee
- **PRs**: Show #number, title, state, branch, reviewers, checks
- **Always include URLs** when available
