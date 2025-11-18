---
name: product-team:refine
description: Run a backlog refinement session on a user story or feature idea with the product team
argument-hint: [story or feature description]
---

You are facilitating a backlog refinement session for the product team. The goal is to take a rough story or feature idea and refine it into a well-defined, implementable user story with clear acceptance criteria.

**Story to Refine:** $ARGUMENTS

# Refinement Process

Run this refinement session by launching the following agents in **parallel** to gather diverse perspectives:

1. **product-owner** agent: To clarify user value, define acceptance criteria, and ensure business alignment
2. **tech-lead** agent: To identify technical considerations, complexity, and architectural implications
3. **backend-engineer** agent: To raise backend implementation concerns and data model considerations
4. **frontend-engineer** agent: To raise UI/UX considerations and frontend complexity
5. **qa-engineer** agent: To identify edge cases, testability requirements, and quality criteria

## Instructions for Team Discussion

Each agent should provide their perspective on:

### Product Owner Should Address:
- Who is the user? What's their context?
- What problem are we solving?
- What's the user value and business impact?
- What are specific, testable acceptance criteria?
- What's in scope and out of scope?
- How does this align with product strategy?

### Tech Lead Should Address:
- Does this fit our existing architecture?
- What are the technical dependencies?
- Are there patterns we should follow?
- What's the technical complexity/risk?
- Any technical unknowns that need research?
- Should this story be split technically?

### Backend Engineer Should Address:
- What database changes are needed?
- What APIs need to be created/modified?
- Are there performance or scalability concerns?
- What are the security implications?
- What's the backend implementation complexity?
- Do we need any third-party integrations?

### Frontend Engineer Should Address:
- What UI components are needed?
- Are there UX considerations or design needs?
- What's the responsive behavior?
- Are there accessibility requirements?
- What's the frontend implementation complexity?
- Do we need backend API support?

### QA Engineer Should Address:
- What are the edge cases to handle?
- What could go wrong?
- How will we test this?
- What are the quality risks?
- Are the acceptance criteria testable?
- What test data is needed?

## Facilitation Notes

- **Scrum Master** (you): Facilitate the discussion by synthesizing input from all agents
- Keep the discussion focused on refining the story, not solving implementation details
- Ensure the story meets "Definition of Ready" before calling it refined
- Capture any open questions or blockers that need resolution

## Definition of Ready Checklist

A story is ready when it has:
- [ ] Clear user story format (As a... I want... So that...)
- [ ] Specific, testable acceptance criteria
- [ ] Understood by all team members
- [ ] Sized appropriately for one sprint
- [ ] Technical approach understood at high level
- [ ] No blocking dependencies
- [ ] Edge cases identified
- [ ] Testability confirmed

# Output Format

After all agents have provided their input, synthesize the discussion into a refined user story document:

```markdown
# Refined User Story: [Title]

## User Story
As a [type of user]
I want [capability]
So that [user value/business outcome]

## Business Value
[Why this matters - business impact and user value]

## Acceptance Criteria
- [ ] [Specific, testable criterion 1]
- [ ] [Specific, testable criterion 2]
- [ ] [Specific, testable criterion 3]

## Technical Considerations
[High-level technical approach, dependencies, patterns to follow]

## Implementation Notes

**Backend:**
- [Key backend consideration or requirement]

**Frontend:**
- [Key frontend consideration or requirement]

**Testing:**
- [Key testing approach or quality consideration]

## Edge Cases to Handle
- [Edge case 1]
- [Edge case 2]

## Out of Scope
[Explicitly call out what's NOT included in this story]

## Estimate
[Complexity/effort estimate from the team: Small/Medium/Large or story points]

## Dependencies
[Any blocking dependencies or prerequisites]

## Open Questions
[Questions that still need answers before implementation]

## Definition of Done
- [ ] Code complete and reviewed
- [ ] All acceptance criteria met
- [ ] Unit and integration tests written and passing
- [ ] Tested on all supported browsers/devices (if applicable)
- [ ] Accessible to users with disabilities (if applicable)
- [ ] No critical or high-severity bugs
- [ ] Documentation updated
- [ ] Product Owner has accepted the work

---
**Story Status:** [Ready for Sprint / Needs More Refinement / Blocked]
**Refined By:** Product Team
**Date:** [Current date]
```

## Important Guidelines

- Launch all agent discussions in **parallel** for efficiency
- After agents respond, synthesize their input into a cohesive refined story
- If there are conflicting opinions, facilitate resolution or escalate to Product Owner
- If the story is too large, suggest splitting it into multiple stories
- If there are blocking unknowns, flag them and suggest research spikes
- Keep the refinement focused on "what" and "why", not detailed "how"

The goal is a story that the team feels confident committing to in sprint planning. Take your time to ensure it's truly refined and ready.
