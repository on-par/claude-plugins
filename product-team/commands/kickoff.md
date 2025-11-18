---
name: product-team:kickoff
description: Run a story kickoff session to align the team on technical approach before implementation starts
argument-hint: [story or feature to kick off]
---

You are facilitating a story kickoff session for the product team. The goal is to align the entire team on the implementation approach before anyone starts coding. This ensures shared understanding and reduces rework.

**Story to Kick Off:** $ARGUMENTS

# Story Kickoff Process

A story kickoff typically takes 30-60 minutes and happens before development begins. The team discusses the story in detail and aligns on the technical approach.

## Kickoff Agenda

### 1. Product Owner Reviews Requirements (5-10 min)

Use the **product-owner** agent to:
- Recap the user story and business value
- Review acceptance criteria in detail
- Answer questions about requirements
- Clarify scope (what's in, what's out)
- Provide examples or use cases
- Share any design mockups or references

### 2. Tech Lead Proposes Technical Approach (10-15 min)

Use the **tech-lead** agent to:
- Propose high-level architecture and design
- Identify existing patterns to follow (with file:line references)
- Suggest reusable components or utilities
- Outline error handling strategy
- Discuss any architectural decisions needed
- Flag technical risks or unknowns
- Propose code organization

### 3. Backend Engineer Discusses Implementation (10-15 min)

Use the **backend-engineer** agent to:
- Design API contracts (endpoints, request/response formats)
- Plan database schema changes or migrations
- Discuss business logic implementation
- Identify third-party integrations needed
- Plan error handling and validation
- Estimate backend tasks
- Coordinate with frontend on API needs

### 4. Frontend Engineer Discusses Implementation (10-15 min)

Use the **frontend-engineer** agent to:
- Plan component architecture
- Discuss state management approach
- Review UX and responsive behavior
- Plan accessibility implementation
- Identify component reuse opportunities
- Estimate frontend tasks
- Confirm API contract needs with backend

### 5. QA Engineer Discusses Testing Strategy (5-10 min)

Use the **qa-engineer** agent to:
- Define testing approach (unit, integration, E2E)
- Identify edge cases to test
- Discuss test data requirements
- Plan manual vs. automated testing
- Define quality gates
- Identify high-risk areas
- Estimate testing effort

### 6. Team Alignment & Task Breakdown (10-15 min)

Use the **scrum-master** agent to facilitate:
- Team alignment on approach
- Breaking story into technical tasks
- Identifying dependencies between tasks
- Deciding who works on what
- Planning pairing or collaboration
- Capturing action items and next steps

## Discussion Topics

**Questions the Product Owner Should Answer:**
- Who is the primary user of this feature?
- What's the expected user flow?
- What happens if [specific scenario]?
- Are there any edge cases we should know about?
- What does success look like?
- When will designs be ready? (if applicable)

**Questions the Tech Lead Should Answer:**
- What architecture patterns should we use?
- What existing code should we reference?
- Should we create shared utilities?
- Are there performance considerations?
- Do we need to refactor anything first?
- What are the technical risks?

**Questions Backend Should Answer:**
- What's the API contract?
- What database changes are needed?
- How do we handle authentication/authorization?
- What validation do we need?
- How do we handle errors?
- What's the performance expectation?

**Questions Frontend Should Answer:**
- What components do we build?
- How do we manage state?
- What's the mobile behavior?
- How do we handle loading/error states?
- What accessibility requirements apply?
- What's the browser support?

**Questions QA Should Answer:**
- What's the testing strategy?
- What are the critical test scenarios?
- What edge cases should we cover?
- What test data do we need?
- When will testing start?
- What are the quality risks?

# Output Format

After the kickoff discussion, create a kickoff summary document:

```markdown
# Story Kickoff Summary: [Story Title]

## Story Overview

**User Story:**
As a [user type]
I want [capability]
So that [value]

**Business Value:**
[Why this matters]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Technical Approach

### Architecture & Design
[High-level technical approach from Tech Lead]

**Patterns to Follow:**
- [Pattern/Component]: `file.ts:123` - [Description]

**New Components/Modules:**
- [Component name]: [Purpose]

### Backend Implementation

**API Endpoints:**
```
POST /api/v1/resource
Request: { ... }
Response: { ... }
```

**Database Changes:**
- Table: `table_name`
- New columns: [List]
- Indexes: [List]
- Migration file: `YYYY-MM-DD-description.sql`

**Business Logic:**
- [Key logic component 1]
- [Key logic component 2]

**Security/Validation:**
- [Security consideration]
- [Validation requirement]

### Frontend Implementation

**Components:**
- `ComponentName`: [Purpose and behavior]

**State Management:**
- [Approach - Context/Redux/local state]

**Responsive Behavior:**
- Mobile: [Behavior]
- Tablet: [Behavior]
- Desktop: [Behavior]

**Accessibility:**
- [Specific a11y requirements]

**UI Flow:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Testing Strategy

**Unit Tests:**
- Backend: [What to test]
- Frontend: [What to test]

**Integration Tests:**
- [API contract tests]
- [Component integration tests]

**E2E Tests:**
- [Critical user flows to test]

**Edge Cases to Test:**
- [Edge case 1]
- [Edge case 2]

**Quality Gates:**
- [ ] All acceptance criteria met
- [ ] Test coverage > X%
- [ ] No critical/high bugs
- [ ] Accessibility verified

## Task Breakdown

### Backend Tasks
- [ ] [Task 1] - Owner: [Name] - Est: [Time]
- [ ] [Task 2] - Owner: [Name] - Est: [Time]

### Frontend Tasks
- [ ] [Task 1] - Owner: [Name] - Est: [Time]
- [ ] [Task 2] - Owner: [Name] - Est: [Time]

### Testing Tasks
- [ ] [Task 1] - Owner: [Name] - Est: [Time]

### Other Tasks
- [ ] [Task 1] - Owner: [Name] - Est: [Time]

## Dependencies

**Blocking Dependencies:**
- [Dependency] - Owner: [Who] - Due: [When]

**Internal Dependencies:**
- [Task X must complete before Task Y]

**External Dependencies:**
- [Third-party service, design asset, etc.]

## Risks and Mitigations

**Risk:** [Description]
- **Impact:** [What happens if this occurs]
- **Likelihood:** [High/Medium/Low]
- **Mitigation:** [How we'll address it]

## Open Questions

- [ ] [Question that needs answer] - Owner: [Who will resolve]

## Implementation Order

1. [First task/component to build]
2. [Second task/component to build]
3. [Continue in logical dependency order]

## Collaboration Plan

**Pairing Opportunities:**
- [Task that would benefit from pairing]

**Review Checkpoints:**
- [When to sync up during implementation]

**API Contract Review:**
- Backend and Frontend align on contract before implementation

## Definition of Done

- [ ] Code complete and peer reviewed
- [ ] All acceptance criteria met
- [ ] Unit tests written and passing (coverage > X%)
- [ ] Integration tests passing
- [ ] Manually tested on [devices/browsers]
- [ ] Accessible (WCAG 2.1 AA if applicable)
- [ ] No critical or high severity bugs
- [ ] Documentation updated
- [ ] Product Owner review and acceptance

---

**Team Alignment:** ✅ Team is aligned and ready to start implementation
**Kickoff Facilitator:** [Scrum Master]
**Date:** [Current date]
**Participants:** Product Owner, Tech Lead, Backend Engineer, Frontend Engineer, QA Engineer
```

## Important Guidelines

- **Launch agent consultations in parallel** for efficiency
- **Keep it timeboxed**: Don't solve every implementation detail; leave room for developers to use judgment
- **Focus on alignment**: Everyone should understand the approach and their role
- **Document decisions**: Capture the technical approach so it's not forgotten
- **Identify risks early**: Surface concerns before they become blockers
- **Break down work**: Clear tasks help parallel work and tracking
- **Ensure testability**: QA input from the start leads to better testing
- **Coordinate dependencies**: Backend and frontend must align on contracts

## Success Criteria

A successful kickoff results in:
- ✅ Team has shared understanding of requirements
- ✅ Technical approach is defined and agreed upon
- ✅ Work is broken down into concrete tasks
- ✅ Dependencies are identified and planned for
- ✅ Testing strategy is clear
- ✅ Risks are known and mitigated
- ✅ Everyone knows what they're building and how

The team should leave the kickoff confident and ready to start implementation. If there are major unknowns, consider a spike or research task before full implementation.
