---
name: product-team:sdlc
description: Execute full SDLC from idea through discovery, story breakdown, refinement, sprint planning, implementation with TDD and PR reviews, demo, and release notes
argument-hint: [feature idea or product vision]
---

You are orchestrating a complete Software Development Life Cycle (SDLC) workflow following Extreme Programming (XP) principles, Test-Driven Development (TDD), and GitHub Flow. This command takes a feature idea all the way from discovery through production-ready release with executive-level documentation.

**Feature Idea:** $ARGUMENTS

# SDLC Workflow Overview

This workflow simulates a high-performing Agile Product Team as described in "Accelerate" by Jez Humble, following these principles:

- **Continuous delivery** with short-lived feature branches
- **Test-Driven Development (TDD)** with strict red-green-refactor cycles
- **Increasing code coverage** - never decreasing
- **Collaborative refinement** with cross-functional team input
- **Quality gates** at every phase
- **Incremental delivery** with one branch per story
- **Executive communication** with professional release notes

## Phase Flow

```
1. Discovery (Research)
   ↓
2. Feature Breakdown (INVEST Criteria)
   ↓
3. Story Refinement (Continuous)
   ↓
4. Sprint Planning (Team Collaboration)
   ↓
5. Sprint Execution (TDD + PR Reviews per Story)
   ↓
6. Sprint Demo (Playwright for Web Apps)
   ↓
7. Release Notes (Executive Summary + Technical Details)
```

# Phase 1: Discovery & Research

## Objective
Understand the problem space, gather context from the codebase, research best practices, and identify technical approaches.

## Process

### Step 1.1: Product Owner Discovery Questions

Launch the **product-owner** agent to ask clarifying questions about the feature idea (one at a time, with multiple choice options where possible). Limit to 5-10 questions maximum.

**Product Owner Should Clarify:**
- Who are the target users?
- What problem does this solve?
- What's the expected user value/business impact?
- Are there existing features this builds on?
- What does success look like?
- Are there constraints (timeline, budget, technical)?
- What are the must-haves vs nice-to-haves?
- Are there compliance/regulatory considerations?

### Step 1.2: Parallel Research

Once the Product Owner has sufficient context, launch **parallel research** using Task tool:

1. **Web Research**: Launch `product-team:web-researcher` agent to:
   - Research best practices and patterns for this type of feature
   - Find relevant libraries, frameworks, and tools
   - Identify security considerations and common pitfalls
   - Use Context7 MCP for latest framework documentation
   - Gather code examples and implementation approaches

2. **Codebase Analysis**: Launch `product-team:codebase-analyst` agent to:
   - Analyze existing architecture and patterns
   - Identify affected files and components
   - Understand current implementation patterns to follow
   - Assess technical feasibility
   - Identify dependencies and integration points

### Step 1.3: Synthesize Research

After both agents complete, synthesize findings into a research document.

**Generate short kebab-case name** from feature idea:
- "User authentication with OAuth" → "user-oauth-authentication"
- "Real-time notifications" → "realtime-notifications"
- "CSV export for reports" → "csv-report-export"

**Create research document at**: `./sdlc/[SHORT_NAME]/research.md`

**Document Structure:**
```markdown
# Feature Discovery: [Feature Name]

## Problem Overview
- Feature description
- Target users
- Business value
- Success criteria

## Web Research Findings
- Recommended approaches
- Relevant libraries/frameworks
- Best practices
- Security considerations
- Code examples

## Codebase Analysis
- Current architecture
- Affected components (with file paths)
- Existing patterns to follow
- Technical constraints
- Integration points

## Proposed Approach
- High-level solution strategy
- Technology choices with justification
- Risk factors and mitigations

## Next Steps
- Prerequisites
- Recommended implementation order
```

# Phase 2: Feature Breakdown Using INVEST Criteria

## Objective
Break the feature into small, consistent, independently valuable user stories that meet INVEST criteria.

## INVEST Criteria

Each story must be:
- **I**ndependent: Can be developed and deployed separately
- **N**egotiable: Details can be discussed, not a contract
- **V**aluable: Delivers value to users or business
- **E**stimable: Team can estimate effort reasonably
- **S**mall: Completable within one sprint
- **T**estable: Clear acceptance criteria, can verify completion

## Process

### Step 2.1: Product Owner Story Creation

Launch **product-owner** agent to:
- Review the research document
- Break the feature into user stories using INVEST criteria
- Focus on **consistent story sizes** - as small as possible while maintaining complete value
- No artificial limits on number of stories (could be 1, could be 20+)
- Each story should be independently deployable

**Story Format:**
```markdown
As a [user type]
I want [capability]
So that [value/outcome]
```

### Step 2.2: Tech Lead Validation

Launch **tech-lead** agent to:
- Review proposed stories for technical feasibility
- Ensure stories can be independently implemented
- Identify technical dependencies between stories
- Suggest story splits if needed for architectural reasons
- Validate that stories align with existing architecture

### Step 2.3: Story Sequencing

Collaborate with **Product Owner** and **Tech Lead** to:
- Order stories by dependency (which must come first)
- Identify stories that can be developed in parallel
- Mark any stories with prerequisites

**Create backlog document at**: `./sdlc/[SHORT_NAME]/backlog.md`

**Backlog Structure:**
```markdown
# Feature Backlog: [Feature Name]

## Epic Overview
[High-level feature description]

## Stories

### Story 1: [Title]
**Priority:** High/Medium/Low
**Dependencies:** None | Story X
**Estimate:** Small/Medium/Large

As a [user]
I want [capability]
So that [value]

**Initial Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2

---

[Repeat for all stories]
```

# Phase 3: Story Refinement (Continuous)

## Objective
Refine high-priority stories collaboratively with the full team to ensure they're "ready" before sprint planning.

## Process

### Step 3.1: Prioritize Refinement

- Focus on refining **top backlog items first**
- Continue refining stories as an ongoing process
- Before sprint planning, ensure top stories are "Definition of Ready"

### Step 3.2: Collaborative Refinement

For each high-priority story, launch the following agents **in parallel**:

1. **product-owner**: Define acceptance criteria, clarify user value
2. **tech-lead**: Identify technical approach, complexity, risks
3. **backend-engineer**: Raise backend considerations
4. **frontend-engineer**: Raise UI/UX considerations
5. **qa-engineer**: Identify edge cases and testing approach

### Step 3.3: Synthesize Refined Story

After agents provide input, create a refined story document.

**Create refined story at**: `./sdlc/[SHORT_NAME]/stories/story-[N].md`

**Refined Story Structure:**
```markdown
# Story [N]: [Title]

## User Story
As a [user type]
I want [capability]
So that [value]

## Business Value
[Impact and importance]

## Acceptance Criteria
- [ ] Specific, testable criterion 1
- [ ] Specific, testable criterion 2
- [ ] Specific, testable criterion 3

## Technical Approach
[High-level implementation strategy]

## Implementation Notes

**Backend:**
- Key backend requirements

**Frontend:**
- Key frontend requirements

**Testing:**
- Testing approach

## Edge Cases
- Edge case 1
- Edge case 2

## Out of Scope
[What's NOT included]

## Estimate
[Small/Medium/Large or story points]

## Dependencies
[Blocking dependencies]

## Definition of Done
- [ ] Code complete and reviewed
- [ ] All acceptance criteria met
- [ ] Tests written and passing (TDD)
- [ ] Code coverage increased (never decreased)
- [ ] Tech Lead approved code quality
- [ ] Product Owner accepted deliverable
- [ ] No critical bugs
- [ ] Documentation updated

---
**Status:** Ready for Sprint
**Refined Date:** [Date]
```

### Step 3.4: Definition of Ready Validation

Each story must meet Definition of Ready:
- [ ] Clear user story format
- [ ] Specific, testable acceptance criteria
- [ ] Understood by all team members
- [ ] Sized for one sprint
- [ ] Technical approach understood
- [ ] No blocking dependencies
- [ ] Edge cases identified
- [ ] Testability confirmed

# Phase 4: Sprint Planning

## Objective
Collaboratively select and commit to stories for the sprint, define sprint goal.

## Process

### Step 4.1: Scrum Master Facilitates

Launch **scrum-master** agent to:
- Review refined backlog
- Facilitate sprint planning session
- Ensure timeboxing
- Help team commit to achievable goals

### Step 4.2: Product Owner Prioritization

Launch **product-owner** agent to:
- Present prioritized backlog with business context
- Explain "why" behind each story
- Propose sprint goal aligned with product strategy
- Clarify scope and acceptance criteria

**Sprint Goal Format:**
> "Deliver [user-facing value] so that [business outcome]"

### Step 4.3: Tech Lead Capacity Assessment

Launch **tech-lead** agent to:
- Assess technical complexity of stories
- Identify technical risks
- Suggest realistic sprint commitment
- Raise any technical blockers

### Step 4.4: Team Commitment

**Scrum Master** and **Product Owner** collaborate to:
- Propose sprint backlog (which stories to include)
- Present proposal to user for approval
- Only escalate to user if agents can't reach consensus

**Create sprint plan at**: `./sdlc/[SHORT_NAME]/sprint-plan.md`

**Sprint Plan Structure:**
```markdown
# Sprint Plan: [Sprint Name/Number]

## Sprint Goal
[1-2 sentence user-focused sprint goal]

## Sprint Backlog

### Committed Stories
1. **Story [N]: [Title]** - [Brief value statement]
2. **Story [N]: [Title]** - [Brief value statement]
3. ...

## Team Capacity
[Story points or number of stories]

## Risks & Mitigation
- Risk: [Description] → Mitigation: [Strategy]

## Sprint Duration
[1-2 weeks typical]

## Definition of Done (Sprint Level)
- [ ] All committed stories completed
- [ ] All tests passing
- [ ] Code coverage increased
- [ ] All PRs reviewed and merged
- [ ] Sprint demo completed
- [ ] Product Owner acceptance

---
**Sprint Start:** [Date]
**Sprint End:** [Date]
```

# Phase 5: Sprint Execution (Story-by-Story TDD + PR Review)

## Objective
Implement each story using strict TDD, create feature branch per story, get PR reviewed and merged before moving to next story.

## Branching Strategy: GitHub Flow

- **One branch per story**: `feature/story-[N]-[short-description]`
- **Branch from**: `main`
- **Merge to**: `main`
- **PR per story**: Created when story is complete
- **Sequential execution** for dependent stories
- **Parallel PRs** for independent stories (but still one story implementation at a time)

## Process Per Story

### Step 5.1: Create Feature Branch

```bash
git checkout main
git pull origin main
git checkout -b feature/story-[N]-[short-description]
```

### Step 5.2: Tech Lead Implementation Planning

Launch **tech-lead** agent to:
- Create detailed implementation plan
- Identify components to modify/create
- Define testing strategy
- Specify implementation order
- Reference existing patterns (file:line)

### Step 5.3: Test-Driven Development (Strict)

Follow **Red → Green → Refactor** cycle for each piece of functionality.

**Code Quality Standards:**
- **No Comments**: Write self-explanatory code; avoid comments unless absolutely necessary
- **Clean Up Comments**: Remove existing unnecessary comments from code being modified
- **Clean Code**: Every line should have a clear purpose
- **Test-Driven**: Always write tests first (TDD is mandatory)

#### TDD Cycle

**For Each Feature/Requirement:**

1. **RED - Write Failing Test**
   - Launch **qa-engineer** to identify test case
   - Launch appropriate engineer (**backend-engineer** or **frontend-engineer**) to write test
   - Run test and verify it fails
   - Commit: `git commit -m "RED: Add test for [feature]"`

2. **GREEN - Minimal Implementation**
   - Launch appropriate engineer to implement minimal code to pass test
   - Run test and verify it passes
   - Run ALL tests to ensure no regressions
   - Check code coverage - must increase or stay same, never decrease
   - Commit: `git commit -m "GREEN: Implement [feature] to pass test"`

3. **REFACTOR - Improve Code**
   - Clean up duplication
   - Improve naming and structure
   - Ensure all tests still pass
   - Verify code coverage hasn't decreased
   - Commit: `git commit -m "REFACTOR: Clean up [component]"`

**Critical Rules:**
- ✅ Always write test BEFORE implementation
- ✅ Code coverage must increase or stay same, NEVER decrease
- ✅ All tests must pass before moving forward
- ✅ Commit after each TDD phase

### Step 5.4: Continuous Code Review (Tech Lead)

**After each TDD cycle**, launch **tech-lead** agent to review changes.

**Tech Lead Reviews For:**
- Code quality and maintainability
- Adherence to patterns
- Absence of unnecessary comments (code should be self-documenting)
- Test quality and coverage
- Security vulnerabilities
- Performance implications
- Error handling

**Review Outcomes:**
- ✅ **Approved**: Continue to next feature
- ⚠️ **Changes Requested**: Fix issues, Tech Lead reviews again
- 🚨 **Critical Issues**: Must fix before proceeding

**Do not proceed until Tech Lead approves.**

### Step 5.5: Complete Story Implementation

Repeat TDD cycles until all acceptance criteria are met.

### Step 5.6: Final Test Verification

Before creating PR:
- Run full test suite: **100% pass rate required**
- Verify code coverage increased (or stayed same)
- Check for linting errors
- Verify build succeeds
- Run any integration tests

**If ANY tests fail**: Return to Step 5.3, fix issues, get Tech Lead approval

### Step 5.7: Create Pull Request

```bash
git push origin feature/story-[N]-[short-description]
gh pr create --title "Story [N]: [Title]" --body "$(cat <<'EOF'
## Story
[Link to story document or paste story]

## Implementation Summary
[What was implemented]

## Testing
- [ ] All tests passing
- [ ] Code coverage: [X]% → [Y]% (increased/maintained)
- [ ] TDD approach followed

## Checklist
- [ ] All acceptance criteria met
- [ ] Code reviewed by Tech Lead
- [ ] No security vulnerabilities
- [ ] Documentation updated

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

### Step 5.8: PR Code Review by Tech Lead

Launch **tech-lead** agent to:
- Review full PR diff
- Check for issues missed in continuous review
- Verify all acceptance criteria met
- Assess merge readiness

**Tech Lead Decision:**
- ✅ **Approve**: PR can be merged
- 🔄 **Request Changes**: Provide specific feedback

### Step 5.9: Address PR Feedback (If Needed)

If Tech Lead requests changes:
1. Implement changes following TDD
2. Get changes reviewed by Tech Lead
3. Repeat until approved
4. Update PR with new commits

**Quality Gate:** PR cannot be merged until:
- All tests pass
- Build succeeds
- Linting passes
- Tech Lead approves
- Code coverage maintained/increased

### Step 5.10: Merge PR

Once Tech Lead approves:
```bash
gh pr merge --squash
git checkout main
git pull origin main
```

### Step 5.11: Move to Next Story

Repeat Steps 5.1-5.10 for each story in sprint backlog.

**Story Execution Strategy:**
- **Dependent stories**: Execute sequentially (must wait for previous to merge)
- **Independent stories**: Can create PRs in parallel after individual completion, but implement one at a time
- **Smart branching**: Each story gets its own feature branch from latest main

## Handling Blockers

If a story encounters a blocker during implementation:

1. **Team Problem-Solving**: Launch **tech-lead**, **product-owner**, and relevant engineers to collaborate on solution
2. **Timebox Resolution**: Attempt to resolve within reasonable effort
3. **Options**:
   - **Resolve**: Team finds solution, continue implementation
   - **Redefine**: Product Owner adjusts story scope/acceptance criteria
   - **Block & Continue**: Mark story as blocked, document issue, move to next story
   - **Escalate**: Only if team cannot resolve

**Never abandon a story silently.** Always document blockers.

# Phase 6: Sprint Demo

## Objective
Demonstrate completed work to Product Owner and stakeholders, gather feedback.

## Process

### Step 6.1: Prepare Demo

**Scrum Master** prepares:
- List of completed stories
- Demo script
- Environment setup (if needed)

### Step 6.2: Execute Demo

**For Web Applications:**

1. **Detect Application Type**: Check for web app indicators (package.json with web server, HTML files, etc.)

2. **Check if App is Running**:
   - Look for running processes on common ports (3000, 8000, 8080, etc.)
   - Check if localhost URLs are accessible

3. **If Web App & Running**: Use Playwright MCP
   - Launch **product-owner** agent with Playwright tools
   - Navigate to application: `browser_navigate`
   - Capture initial state: `browser_snapshot`
   - Interact with features: `browser_click`, `browser_type`, etc.
   - Verify acceptance criteria by interacting with UI
   - Take screenshots of key features: `browser_take_screenshot`

4. **If App Not Running**: Provide instructions to start app, or fall back to code walkthrough

**For Non-Web Applications:**
- Code walkthrough
- Test output demonstration
- Example usage / CLI demos

### Step 6.3: Product Owner Acceptance

Launch **product-owner** agent to:
- Review each completed story
- Verify acceptance criteria met
- Assess user value delivered
- Provide feedback

**Product Owner Decision per Story:**
- ✅ **Accepted**: Story is done
- 🔄 **Changes Requested**: Document changes needed
- ❌ **Not Accepted**: Explain what's missing

### Step 6.4: Document Demo Results

**Create demo notes at**: `./sdlc/[SHORT_NAME]/demo-notes.md`

```markdown
# Sprint Demo: [Sprint Name]

## Date
[Demo date]

## Attendees
- Product Owner
- Tech Lead
- Development Team
- Stakeholders (if any)

## Sprint Goal
[Sprint goal]

## Stories Demonstrated

### Story [N]: [Title]
**Status:** ✅ Accepted | 🔄 Changes Requested | ❌ Not Accepted
**Demo:** [How it was demoed]
**Feedback:** [Product Owner/Stakeholder feedback]
**Screenshots:** [If applicable]

[Repeat for each story]

## Sprint Metrics
- **Stories Committed:** [N]
- **Stories Completed:** [N]
- **Stories Accepted:** [N]
- **Test Pass Rate:** 100%
- **Code Coverage:** [X]% → [Y]%

## Feedback & Next Steps
[Key feedback points and follow-up actions]

---
**Demo Facilitated By:** Scrum Master
**Product Owner:** [Accepted/Requested Changes]
```

### Step 6.5: Handle Changes Requested

If Product Owner requests changes:
- Treat as new stories or bugs
- Add to backlog for next sprint
- Don't re-open completed stories

# Phase 7: Release Notes

## Objective
Create executive-level release notes with both summary and technical details, including screenshots.

## Output Format: Two-Tiered Documentation

### Tier 1: Executive Summary (Word/PDF)

**Create at**: `./sdlc/[SHORT_NAME]/release-notes-executive.docx`

**Use document-skills:docx skill** to create professional Word document.

**Executive Summary Structure:**
```markdown
# Release Notes: [Feature Name]
**Release Date:** [Date]
**Version:** [Version number]

## Executive Summary
[1-2 paragraphs: What was delivered, why it matters, business impact]

## User Value Delivered
- **[Capability 1]**: [Business benefit]
- **[Capability 2]**: [Business benefit]
- **[Capability 3]**: [Business benefit]

## Key Features
### [Feature 1 Name]
[Screenshot]
[2-3 sentences describing feature and user impact]

### [Feature 2 Name]
[Screenshot]
[2-3 sentences describing feature and user impact]

## Business Metrics
- **Stories Delivered:** [N]
- **User Value Points:** [N]
- **Quality Metrics:** [Test coverage, etc.]

## What's Next
[Brief preview of upcoming work]

---
**Prepared By:** Product Team
**Approved By:** Product Owner
```

### Tier 2: Technical Release Notes (Markdown)

**Create at**: `./sdlc/[SHORT_NAME]/release-notes-technical.md`

**Technical Details Structure:**
```markdown
# Technical Release Notes: [Feature Name]

## Release Information
- **Release Date:** [Date]
- **Version:** [Version number]
- **Sprint:** [Sprint name/number]

## Overview
[Technical description of changes]

## Stories Completed

### Story [N]: [Title]
**PR:** #[PR number]
**Branch:** feature/story-[N]-[description]
**Files Changed:** [N]
**Test Coverage:** [X]% → [Y]%

**Changes:**
- [Technical change 1]
- [Technical change 2]

**Testing:**
- [Test approach]
- [Test coverage details]

[Repeat for each story]

## Technical Highlights

### Architecture Changes
[Any architectural updates]

### New Dependencies
- [Library/package]: [Version] - [Purpose]

### Database Changes
[Schema changes, migrations]

### API Changes
[New endpoints, modified endpoints]

### Security Enhancements
[Security improvements]

### Performance Improvements
[Performance optimizations]

## Testing Summary
- **Total Tests:** [N]
- **Pass Rate:** 100%
- **Code Coverage:** [X]% → [Y]% (↑ [Z]%)
- **New Tests Added:** [N]

## Deployment Notes
[Deployment instructions, environment variables, configuration changes]

## Known Issues
[Any known limitations or issues]

## Breaking Changes
[Any breaking changes]

## Rollback Plan
[How to rollback if needed]

## Documentation Updated
- [Doc 1]
- [Doc 2]

---
**Generated:** [Date]
**Branch:** main
**Commits:** [Commit range]
```

### Step 7.1: Gather Screenshots

For web applications:
- Use screenshots captured during demo
- Capture additional screenshots if needed using Playwright
- Include screenshots of key user-facing changes

### Step 7.2: Generate Executive Summary

Launch **product-owner** agent to:
- Write executive summary focused on business value
- Highlight user impact
- Explain business metrics
- Use non-technical language

### Step 7.3: Generate Technical Details

Launch **tech-lead** agent to:
- Document technical changes
- List all PRs and commits
- Detail architecture/dependency changes
- Provide deployment instructions
- Document testing summary

### Step 7.4: Create Word Document

Use **document-skills:docx** skill:
```
Skill: document-skills:docx

Create a professional executive release notes document with:
- Title and version
- Executive summary (from Product Owner)
- Key features with screenshots
- Business metrics
- Professional formatting
- Anthropic branding (if applicable)

Save as: ./sdlc/[SHORT_NAME]/release-notes-executive.docx
```

### Step 7.5: Finalize Documentation

Ensure both documents are complete:
- ✅ Executive summary (Word/PDF)
- ✅ Technical release notes (Markdown)
- ✅ Screenshots included
- ✅ All sections complete
- ✅ Reviewed by Product Owner

# Implementation Instructions

## Step-by-Step Execution

1. **Initialize Workflow**
   - Use TodoWrite to create comprehensive phase checklist
   - Track progress through all 7 phases
   - Update todos as each phase completes

2. **Execute Phases Sequentially**
   - Complete Phase 1 before moving to Phase 2
   - Don't skip phases
   - Ensure quality gates pass before proceeding

3. **Launch Agents Strategically**
   - Use Task tool with appropriate subagent_type
   - Launch in parallel when tasks are independent
   - Launch sequentially when tasks depend on each other
   - Product Owner: Requirements, prioritization, acceptance
   - Tech Lead: Planning, architecture, code review
   - Backend Engineer: Backend implementation
   - Frontend Engineer: Frontend implementation
   - QA Engineer: Test strategy, edge cases
   - Scrum Master: Facilitation, process guidance

4. **Agent Naming Convention**
   - `subagent_type: "product-team:product-owner"`
   - `subagent_type: "product-team:tech-lead"`
   - `subagent_type: "product-team:backend-engineer"`
   - `subagent_type: "product-team:frontend-engineer"`
   - `subagent_type: "product-team:qa-engineer"`
   - `subagent_type: "product-team:scrum-master"`
   - `subagent_type: "product-team:web-researcher"`
   - `subagent_type: "product-team:codebase-analyst"`

5. **Follow TDD Strictly**
   - Red → Green → Refactor cycle
   - Always test first
   - Never decrease code coverage
   - All tests must pass

6. **Enforce Quality Gates**
   - Discovery: Research complete
   - Breakdown: Stories meet INVEST
   - Refinement: Stories meet Definition of Ready
   - Planning: Sprint goal and backlog defined
   - Execution: Tests pass, Tech Lead approves, PR merged
   - Demo: Product Owner accepts
   - Release Notes: Both tiers complete

7. **Handle Failures Gracefully**
   - Tests fail: Fix and re-run
   - Tech Lead rejects: Address feedback
   - Product Owner rejects: Implement changes
   - Blocker encountered: Team problem-solving
   - Can't resolve: Document and continue with other stories

8. **Document Everything**
   - Create all specified documents
   - Use file paths as specified
   - Include screenshots where applicable
   - Keep documents updated as sprint progresses

## Agent Parallelization Strategy

**Parallel Execution (Launch Together):**
- Phase 1: Web research + Codebase analysis
- Phase 3: All 5 team members for refinement
- Phase 4: Product Owner + Tech Lead + Scrum Master for planning

**Sequential Execution (One After Another):**
- Phase 5: TDD cycles (test → implement → review)
- Phase 5: Stories with dependencies
- Phase 6: Demo per story
- Phase 7: Executive summary → Technical details → Document creation

## Progress Tracking

Use TodoWrite to track:
```
Phase 1: Discovery & Research
├── Product Owner clarifying questions
├── Web research (parallel)
├── Codebase analysis (parallel)
└── Synthesize research document

Phase 2: Feature Breakdown
├── Product Owner story creation
├── Tech Lead validation
└── Create backlog document

Phase 3: Story Refinement
├── Refine Story 1 (parallel team)
├── Refine Story 2 (parallel team)
└── ... (continue for top stories)

Phase 4: Sprint Planning
├── Scrum Master facilitation
├── Product Owner prioritization
├── Tech Lead capacity assessment
└── Create sprint plan

Phase 5: Sprint Execution
├── Story 1: Branch → TDD → PR → Review → Merge
├── Story 2: Branch → TDD → PR → Review → Merge
└── ... (continue for all sprint stories)

Phase 6: Sprint Demo
├── Prepare demo
├── Execute demo (Playwright if web app)
├── Product Owner acceptance
└── Document demo results

Phase 7: Release Notes
├── Gather screenshots
├── Product Owner: Executive summary
├── Tech Lead: Technical details
├── Create Word document
└── Finalize documentation
```

# Success Criteria

The SDLC is **successfully complete** when:

✅ **Phase 1**: Research document created with web + codebase findings
✅ **Phase 2**: Feature broken into INVEST-compliant stories
✅ **Phase 3**: Top stories refined and "Definition of Ready"
✅ **Phase 4**: Sprint plan created with team commitment
✅ **Phase 5**: All committed stories implemented, tested, reviewed, merged
  - ✅ One branch per story
  - ✅ All tests passing (100% pass rate)
  - ✅ Code coverage increased (never decreased)
  - ✅ All PRs reviewed by Tech Lead and approved
  - ✅ All PRs merged to main
✅ **Phase 6**: Sprint demo completed, Product Owner accepted stories
✅ **Phase 7**: Release notes created (both executive and technical)
  - ✅ Executive summary (Word/PDF) with screenshots
  - ✅ Technical release notes (Markdown)
  - ✅ Product Owner approved

# Important Notes

## Quality Principles
- **Never skip TDD**: Tests first, always
- **Never decrease coverage**: Code coverage only goes up
- **Never skip reviews**: Tech Lead reviews all changes
- **Never skip quality gates**: All tests must pass
- **Never merge without approval**: Tech Lead must approve PRs

## Team Collaboration
- **Product Owner**: Represents user, defines value, accepts work
- **Tech Lead**: Ensures quality, reviews code, makes technical decisions
- **Engineers**: Implement features following TDD
- **QA Engineer**: Defines test strategy, identifies edge cases
- **Scrum Master**: Facilitates process, removes impediments

## Process Discipline
- **One story at a time**: Don't start next until current is merged
- **One branch per story**: GitHub Flow with short-lived branches
- **Small batches**: Stories should be as small as possible
- **Continuous integration**: Merge to main frequently
- **Quality over speed**: Never compromise quality for velocity

## Flexibility
- **Adapt to context**: Detect web apps, adjust demo approach
- **Team problem-solving**: Let agents collaborate to resolve issues
- **Escalate when stuck**: Only ask user if agents can't decide
- **Document blockers**: Never silently skip stories

This SDLC workflow embodies the principles from "Accelerate": continuous delivery, trunk-based development, comprehensive testing, and fast feedback loops. Execute with discipline and let the quality gates ensure excellence at every step.
