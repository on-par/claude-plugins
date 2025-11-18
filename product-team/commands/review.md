---
name: product-team:review
description: Run a sprint review/demo session to demonstrate completed work and gather feedback
argument-hint: [story or feature to review]
---

You are facilitating a sprint review (demo) session for the product team. The goal is to demonstrate completed work, validate it against acceptance criteria, gather feedback, and decide if the work is ready to ship to users.

**Work to Review:** $ARGUMENTS

# Sprint Review Process

A sprint review typically takes 1-2 hours and demonstrates all completed work from the sprint. It's collaborative, not just a presentation. Stakeholders provide feedback and the team adapts the backlog based on learnings.

## Review Agenda

### 1. Demo the Work (20-30 min per story)

**Demonstrator** (whoever built it) should:
- Show the feature working in a realistic environment
- Walk through the user journey
- Highlight key functionality
- Demonstrate edge cases handled
- Show responsive behavior (if applicable)
- Show error handling (if applicable)

### 2. Product Owner Validates Requirements (5-10 min)

Use the **product-owner** agent to:
- Validate against acceptance criteria
- Assess user value delivered
- Test the feature from user perspective
- Provide feedback on user experience
- Decide: Accept, Accept with Minor Changes, or Request Rework

### 3. QA Validates Quality (5-10 min)

Use the **qa-engineer** agent to:
- Verify acceptance criteria are met
- Confirm edge cases are handled
- Review test coverage
- Identify any bugs or quality concerns
- Assess if quality gates are met
- Comment on production readiness

### 4. Tech Lead Assesses Technical Quality (5 min)

Use the **tech-lead** agent to:
- Review technical implementation approach
- Verify code quality and patterns followed
- Assess technical debt introduced or reduced
- Note any technical improvements needed
- Comment on maintainability

### 5. Team Feedback and Next Steps (5-10 min)

Use the **scrum-master** agent to facilitate:
- Gather stakeholder feedback
- Identify follow-up work or improvements
- Update the backlog with new insights
- Celebrate accomplishments

## Review Checklist

**Product Owner Reviews:**
- [ ] Does this meet all acceptance criteria?
- [ ] Does this solve the user problem?
- [ ] Is the user experience intuitive?
- [ ] Is this ready to ship to real users?
- [ ] What feedback do I have?

**QA Engineer Reviews:**
- [ ] Are all acceptance criteria verified?
- [ ] Are edge cases properly handled?
- [ ] Is test coverage adequate?
- [ ] Are there any open bugs? Severity?
- [ ] Do we meet quality gates?
- [ ] What risks exist if we ship this?

**Tech Lead Reviews:**
- [ ] Is the code well-structured?
- [ ] Are patterns and standards followed?
- [ ] Is it maintainable?
- [ ] Technical debt introduced or reduced?
- [ ] Any security or performance concerns?

**Backend Engineer (if applicable):**
- [ ] Are APIs working as designed?
- [ ] Performance acceptable?
- [ ] Security measures in place?
- [ ] Error handling robust?

**Frontend Engineer (if applicable):**
- [ ] UI matches design expectations?
- [ ] Works on mobile and desktop?
- [ ] Accessibility requirements met?
- [ ] Loading and error states handled?

# Output Format

After the review session, create a review summary document:

```markdown
# Sprint Review Summary: [Story/Feature Title]

**Review Date:** [Date]
**Reviewed By:** Product Team
**Demonstrator:** [Who demoed the work]

## Story Reviewed

**User Story:**
As a [user type]
I want [capability]
So that [value]

**Acceptance Criteria:**
- [✓/✗] [Criterion 1] - [Status/Notes]
- [✓/✗] [Criterion 2] - [Status/Notes]
- [✓/✗] [Criterion 3] - [Status/Notes]

## Demo Summary

**What Was Demonstrated:**
[Brief description of what was shown in the demo]

**User Flow Demonstrated:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Highlights:**
- [Notable feature or implementation]
- [Impressive aspect worth celebrating]

## Product Owner Assessment

**User Value Delivered:**
[Assessment of whether this solves the user problem and delivers value]

**User Experience Feedback:**
[Feedback on usability, intuitiveness, design]

**Acceptance Criteria Status:**
- Met: [Number] of [Total]
- Not Met: [Number] (details below)

**Decision:** [ACCEPTED ✅ / ACCEPTED WITH CHANGES ⚠️ / REQUIRES REWORK ❌]

**Feedback:**
- [Specific feedback point 1]
- [Specific feedback point 2]

## QA Assessment

**Quality Verification:**
- Test Coverage: [Percentage or assessment]
- Edge Cases Tested: [List key ones]
- Integration Testing: [Status]
- Performance Testing: [Status if applicable]

**Open Bugs:**
- Critical: [Number]
- High: [Number]
- Medium: [Number]
- Low: [Number]

**Quality Gates:**
- [✓/✗] All acceptance criteria met
- [✓/✗] No critical/high severity bugs
- [✓/✗] Test coverage > X%
- [✓/✗] Performance requirements met
- [✓/✗] Security review passed (if applicable)
- [✓/✗] Accessibility verified (if applicable)

**Quality Concerns:**
- [Concern 1 and recommendation]

**Production Readiness:** [READY ✅ / READY WITH CAVEATS ⚠️ / NOT READY ❌]

## Tech Lead Assessment

**Technical Implementation:**
[Assessment of code quality, architecture, patterns used]

**Code Quality:**
- Patterns followed: [✓/✗]
- Code reviewed: [✓/✗]
- Documentation updated: [✓/✗]

**Technical Debt:**
- Introduced: [None / Minor / Moderate / Significant]
- Addressed: [Description of any debt reduced]

**Maintainability:** [High / Medium / Low]

**Technical Concerns:**
- [Concern or suggestion for improvement]

## Stakeholder Feedback

**Positive Feedback:**
- [What stakeholders liked]

**Suggested Improvements:**
- [Improvement suggestion 1]
- [Improvement suggestion 2]

**Questions Raised:**
- [Question or uncertainty from stakeholders]

## Follow-Up Work

**Required Before Ship (Blockers):**
- [ ] [Critical fix or change] - Owner: [Who] - Due: [When]

**Nice-to-Have Improvements (Backlog):**
- [ ] [Enhancement idea] - Priority: [High/Medium/Low]
- [ ] [Enhancement idea] - Priority: [High/Medium/Low]

**New Stories Created:**
- [Story title]: [Brief description]

## Metrics

**Effort:**
- Estimated: [Original estimate]
- Actual: [Actual time spent]
- Variance: [+/- percentage]

**Quality:**
- Bugs found: [Number]
- Test coverage: [Percentage]
- Code review comments: [Number]

## Final Decision

**Story Status:** [DONE ✅ / DONE WITH FOLLOW-UP ⚠️ / NEEDS REWORK ❌]

**Ship Decision:** [SHIP NOW ✅ / SHIP AFTER [fixes] ⚠️ / DON'T SHIP ❌]

**Rationale:**
[Explanation of the decision]

## Celebration

**Wins:**
- [What went well that's worth celebrating]
- [Team member recognition for great work]

---

**Next Steps:**
1. [Immediate next step]
2. [Follow-up action]

**Reviewed By:** Product Owner, Tech Lead, QA Engineer, Team
**Facilitator:** Scrum Master
**Date:** [Current date]
```

## Important Guidelines

- **Launch agent reviews in parallel** for efficiency
- **Focus on user value**: Does this actually help users?
- **Be honest about quality**: Don't ship work that's not ready
- **Celebrate achievements**: Recognize the team's hard work
- **Gather actionable feedback**: Turn feedback into backlog items
- **Make clear decisions**: Accept, request changes, or reject—don't be ambiguous
- **Update the backlog**: Capture new ideas and feedback as stories
- **Keep it collaborative**: This is not a presentation, it's a conversation

## Acceptance Criteria

**Work is ACCEPTED if:**
- ✅ All acceptance criteria are met
- ✅ No critical or high severity bugs
- ✅ Quality gates are met
- ✅ Product Owner confirms user value delivered
- ✅ QA confirms production readiness
- ✅ Technical quality is acceptable

**Work REQUIRES REWORK if:**
- ❌ Acceptance criteria not met
- ❌ Critical bugs exist
- ❌ User experience is poor
- ❌ Quality standards not met
- ❌ Technical implementation has major issues

**Work is ACCEPTED WITH CHANGES if:**
- ⚠️ Minor issues that don't block release
- ⚠️ Polish items that can be addressed quickly
- ⚠️ Enhancement requests that aren't critical

## Tips for Effective Reviews

1. **Demo in a realistic environment**: Show it working like users will experience it
2. **Tell a story**: Walk through a user journey, not just feature checklist
3. **Show edge cases**: Demonstrate error handling and boundary conditions
4. **Invite feedback**: Actively ask for stakeholder input
5. **Be transparent**: Don't hide known issues; address them proactively
6. **Capture insights**: Write down feedback and new ideas
7. **Decide promptly**: Don't leave acceptance decisions hanging
8. **Celebrate wins**: Acknowledge great work and team effort

The sprint review is about inspecting what was built and adapting the plan based on what we learned. Be honest, be collaborative, and focus on delivering real value to users.
