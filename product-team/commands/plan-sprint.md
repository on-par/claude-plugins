---
name: product-team:plan-sprint
description: Run a sprint planning session with the product team to select and commit to sprint work
argument-hint: [sprint goal or prioritized backlog]
---

You are facilitating a sprint planning session for the product team. The goal is to select stories from the backlog, discuss capacity and complexity, and commit to a focused sprint goal with achievable work.

**Sprint Context:** $ARGUMENTS

# Sprint Planning Process

Sprint planning is typically timeboxed to 2-4 hours for a 2-week sprint and has two main parts:

## Part 1: What Will We Do? (Sprint Goal & Backlog Selection)

1. **Product Owner Presents**: Use the **product-owner** agent to:
   - Present the proposed sprint goal
   - Share prioritized backlog items
   - Explain business value and priorities
   - Answer questions about requirements

2. **Team Capacity Discussion**: Use the **scrum-master** agent to:
   - Determine team capacity (account for PTO, holidays, meetings, support)
   - Review velocity from recent sprints
   - Identify any capacity constraints

3. **Story Discussion**: For each prioritized story, use agents in **parallel**:
   - **tech-lead**: Assess technical complexity and dependencies
   - **backend-engineer**: Estimate backend effort
   - **frontend-engineer**: Estimate frontend effort
   - **qa-engineer**: Estimate testing effort and identify risks

## Part 2: How Will We Do It? (Task Breakdown & Commitment)

After selecting stories, the team should:
- Break stories into high-level tasks
- Identify dependencies between stories
- Confirm the sprint goal is achievable
- Commit to the sprint backlog

## Discussion Points for Each Story

### Product Owner Should Share:
- Business value and priority
- User impact
- Acceptance criteria recap
- Scope clarifications

### Tech Lead Should Assess:
- Technical complexity
- Alignment with architecture
- Dependencies on other work
- Risk factors
- Suggested technical approach

### Backend Engineer Should Estimate:
- Backend implementation effort
- Database changes needed
- API development required
- Integration complexity
- Backend testing effort

### Frontend Engineer Should Estimate:
- Frontend implementation effort
- Component development needed
- UI/UX complexity
- Frontend testing effort
- Design dependency

### QA Engineer Should Estimate:
- Testing effort
- Quality risks
- Edge cases to cover
- Test environment needs
- Manual vs automated testing

### Scrum Master Should Facilitate:
- Keep discussion timeboxed
- Track team capacity vs committed work
- Note dependencies and risks
- Ensure team commitment is realistic
- Capture action items

## Team Velocity and Capacity

**Velocity Calculation:**
- Review last 3-5 sprints to establish average velocity
- Account for team changes or external factors
- Don't over-commit; leave buffer for unknowns

**Capacity Considerations:**
- Team member PTO or holidays
- Onboarding time for new members
- Support/maintenance work allocation
- Meeting time (usually 10-15% of sprint)
- Technical debt/improvement work (recommend 20%)

# Output Format

After the planning session, create a sprint plan document:

```markdown
# Sprint Planning: Sprint [Number] - [Sprint Name]

## Sprint Goal
[Clear, focused goal that describes the value delivered this sprint]

## Sprint Duration
**Start Date:** [Date]
**End Date:** [Date]
**Sprint Length:** [Number] days

## Team Capacity

**Team Members:**
- [Name/Role]: [Available capacity] (notes: [PTO, etc.])
- [Name/Role]: [Available capacity]

**Total Capacity:** [Total story points or hours available]

**Velocity:**
- Last sprint: [Points/hours]
- Average (last 3 sprints): [Points/hours]
- Planned for this sprint: [Points/hours]

## Committed Stories

### Story 1: [Story Title]
**Priority:** [High/Medium/Low]
**Estimate:** [Story points or hours]
**Business Value:** [Brief value statement]

**Tasks:**
- [ ] [Backend task]
- [ ] [Frontend task]
- [ ] [Testing task]

**Dependencies:** [Any blocking or dependent work]
**Risks:** [Quality or delivery risks]
**Owner:** [Primary developer(s)]

### Story 2: [Story Title]
[Same structure...]

**Total Committed:** [Total story points/hours]

## Stretch Goals (If Capacity Allows)

### Story X: [Story Title]
**Estimate:** [Points/hours]
[Brief description - only work on if committed stories complete early]

## Dependencies and Risks

**External Dependencies:**
- [Dependency description] - Owner: [Who] - Due: [When]

**Technical Risks:**
- [Risk description] - Mitigation: [Approach]

**Capacity Risks:**
- [Risk description] - Mitigation: [Approach]

## Sprint Schedule

**Key Dates:**
- Daily Standup: [Time and format]
- Mid-Sprint Check-in: [Date]
- Sprint Review: [Date and time]
- Sprint Retrospective: [Date and time]

## Technical Approach Highlights

**Major Technical Work:**
- [Description of significant technical initiatives]

**Technical Debt to Address:**
- [Technical debt items included in sprint]

## Definition of Done Reminder

For all stories:
- [ ] Code complete and peer reviewed
- [ ] All acceptance criteria met
- [ ] Automated tests written and passing
- [ ] Manual testing completed
- [ ] No critical/high severity bugs
- [ ] Documentation updated
- [ ] Product Owner accepted

## Success Metrics

**Sprint will be successful if:**
- Sprint goal achieved
- All committed stories completed
- Quality maintained (test coverage, code reviews)
- No major production issues introduced

---

**Team Commitment:**
The team commits to delivering the sprint goal and making their best effort to complete all committed stories. If unforeseen blockers arise, we will communicate early and adjust as needed.

**Planned By:** Product Team
**Date:** [Current date]
**Facilitator:** [Scrum Master]
```

## Important Guidelines

- **Respect timeboxing**: Don't let planning drag on; make decisions and move forward
- **Focus on the sprint goal**: All committed work should support the sprint goal
- **Be realistic**: It's better to under-commit and over-deliver than the reverse
- **Leave buffer**: Account for unknowns, bugs, and support work
- **Get team buy-in**: Ensure the whole team commits, not just individuals
- **Identify dependencies early**: Flag blockers before they become problems
- **Plan for quality**: Include testing effort, code review time, and tech debt work
- **Document decisions**: Capture the plan so everyone has a reference

## Facilitation Tips

1. **Product Owner** presents first, then team discusses
2. Launch agent consultations in **parallel** for efficiency
3. Synthesize input from all agents to create balanced estimates
4. If stories are not well-refined, send them back to refinement
5. Track capacity vs. commitments in real-time
6. End with clear team commitment and sprint goal

The goal is a realistic sprint plan that the team believes they can achieve while delivering real value aligned with the sprint goal.
