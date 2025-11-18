---
name: product-team:retro
description: Run a sprint retrospective to reflect on what went well, what didn't, and identify improvements
argument-hint: [sprint identifier or focus topic]
---

You are facilitating a sprint retrospective for the product team. The goal is to create a safe space for honest reflection, celebrate successes, identify challenges, and commit to actionable improvements for the next sprint.

**Retrospective Context:** $ARGUMENTS

# Retrospective Process

A sprint retrospective typically takes 1-2 hours at the end of each sprint. It's the team's opportunity to inspect and adapt their process, collaboration, and practices.

## Retrospective Agenda

### 1. Set the Stage (5 min)

Use the **scrum-master** agent to:
- Create a safe, trust-filled environment
- Remind the team of retrospective guidelines:
  * This is a blameless space
  * Focus on the process, not individuals
  * Be honest and constructive
  * Everyone's input is valued
  * What's discussed here stays here
- Set the tone: We're here to improve, not to blame

### 2. Gather Data (15-20 min)

Ask each team member (represented by agents) to reflect on the sprint:

Use the following agents in **parallel** to gather diverse perspectives:

**Product Owner** (product-owner agent):
- Reflect on product/business aspects
- Backlog management effectiveness
- Stakeholder communication
- Value delivery

**Scrum Master** (scrum-master agent):
- Reflect on process and ceremonies
- Team dynamics and collaboration
- Impediment removal effectiveness
- Facilitation quality

**Tech Lead** (tech-lead agent):
- Reflect on technical decisions and architecture
- Code quality and standards
- Technical debt management
- Technical collaboration

**Backend Engineer** (backend-engineer agent):
- Reflect on backend development process
- Technical challenges faced
- Tools and infrastructure
- Code review process

**Frontend Engineer** (frontend-engineer agent):
- Reflect on frontend development process
- Design collaboration
- Technical challenges faced
- Testing and quality

**QA Engineer** (qa-engineer agent):
- Reflect on testing process and quality
- Bug detection and prevention
- Test coverage and effectiveness
- Quality standards

### 3. Generate Insights (15-20 min)

Use the **scrum-master** agent to facilitate discussion:
- Group similar feedback themes
- Identify patterns and root causes
- Discuss why things happened the way they did
- Explore what enabled successes
- Understand what caused challenges

### 4. Decide What to Do (20-30 min)

Use the **scrum-master** agent to facilitate:
- Identify top 2-3 improvement opportunities
- Brainstorm specific actions to address them
- Ensure actions are:
  * Specific and concrete
  * Assigned to owners
  * Time-bound
  * Measurable when possible
- Don't try to fix everything—focus on high-impact changes

### 5. Close the Retro (5 min)

- Review action items and owners
- Express appreciation for honest participation
- Commit to trying the improvements

## Retrospective Formats

Choose a format that keeps retrospectives fresh and engaging:

### Format 1: Start/Stop/Continue
- **Start**: What should we start doing?
- **Stop**: What should we stop doing?
- **Continue**: What should we keep doing?

### Format 2: What Went Well / What Didn't Go Well / Ideas for Improvement
- **What Went Well**: Celebrate successes
- **What Didn't Go Well**: Identify challenges
- **Ideas for Improvement**: Brainstorm solutions

### Format 3: 4Ls
- **Liked**: What did we enjoy?
- **Learned**: What did we learn?
- **Lacked**: What was missing?
- **Longed For**: What do we wish we had?

### Format 4: Sailboat
- **Wind** (pushing us forward): What helped us move fast?
- **Anchors** (holding us back): What slowed us down?
- **Rocks** (risks ahead): What challenges do we see coming?
- **Island** (goal): Where are we trying to go?

## Reflection Prompts

**Product & Delivery:**
- Did we deliver the value we planned?
- Was the sprint goal clear and achievable?
- How effective was our planning?
- Did we have the right priorities?

**Process & Ceremonies:**
- Were our ceremonies effective and valuable?
- Did we collaborate well as a team?
- Were impediments removed quickly?
- Did we have clear communication?

**Technical & Quality:**
- Did we maintain code quality?
- Was technical debt managed well?
- Did we have effective code reviews?
- Was our testing adequate?
- Did we follow our standards?

**Team & Collaboration:**
- Did we support each other?
- Was workload distributed fairly?
- Did we communicate effectively?
- Were we able to focus without interruptions?

**Tools & Environment:**
- Do we have the tools we need?
- Is our development environment effective?
- Are there infrastructure issues?
- Do we need better tooling?

# Output Format

After the retrospective, create a retrospective summary document:

```markdown
# Sprint Retrospective: Sprint [Number] - [Date]

**Facilitator:** Scrum Master
**Participants:** [List team members/roles]
**Format Used:** [Retro format name]
**Duration:** [Actual time spent]

## Sprint Summary

**Sprint Goal:** [The sprint goal]
**Sprint Goal Achievement:** [Fully Met ✅ / Partially Met ⚠️ / Not Met ❌]

**Stories Completed:** [Number] of [Committed]
**Velocity:** [Points completed]

## What Went Well ✅

### Theme 1: [Category/Theme]
- [Specific thing that went well]
- [Another positive]

### Theme 2: [Category/Theme]
- [Specific thing that went well]

**Team Member Highlights:**
- **[Role]**: [Their positive observation]
- **[Role]**: [Their positive observation]

## What Didn't Go Well ⚠️

### Theme 1: [Category/Theme]
- [Specific challenge]
  - **Impact**: [How this affected the team]
  - **Root Cause**: [Why this happened]

### Theme 2: [Category/Theme]
- [Specific challenge]
  - **Impact**: [How this affected the team]
  - **Root Cause**: [Why this happened]

**Team Member Concerns:**
- **[Role]**: [Their concern]
- **[Role]**: [Their concern]

## Ideas for Improvement 💡

### Brainstormed Ideas
1. [Improvement idea 1]
2. [Improvement idea 2]
3. [Improvement idea 3]
4. [Improvement idea 4]

### Discussion Highlights
[Summary of key discussion points and insights]

## Action Items 🎯

### Action 1: [Specific, Actionable Item]
- **Owner:** [Person responsible]
- **Due Date:** [When this should be done by]
- **Success Metric:** [How we'll know it worked]
- **Priority:** [High/Medium/Low]

### Action 2: [Specific, Actionable Item]
- **Owner:** [Person responsible]
- **Due Date:** [When this should be done by]
- **Success Metric:** [How we'll know it worked]
- **Priority:** [High/Medium/Low]

### Action 3: [Specific, Actionable Item]
- **Owner:** [Person responsible]
- **Due Date:** [When this should be done by]
- **Success Metric:** [How we'll know it worked]
- **Priority:** [High/Medium/Low]

## Previous Retro Actions - Status Check

### From Last Retrospective:
- [✅] **[Completed Action]** - [Outcome/impact]
- [🔄] **[In Progress Action]** - [Current status]
- [❌] **[Not Done Action]** - [Reason not done / decision to abandon]

## Metrics & Observations

**Velocity Trend:**
- Last sprint: [Points]
- This sprint: [Points]
- Trend: [Increasing/Stable/Decreasing]

**Quality Metrics:**
- Bugs found: [Number]
- Bug escape rate: [Percentage]
- Test coverage: [Percentage]

**Collaboration:**
- Pair programming sessions: [Number]
- Code review turnaround: [Average time]
- Blocked time: [Total time blocked]

## Key Insights

**Patterns Identified:**
- [Pattern or trend noticed across sprints]

**Root Causes Discovered:**
- [Root cause of recurring issues]

**Success Factors:**
- [What enabled our successes]

## Appreciation & Celebration

**Team Shoutouts:**
- [Team member] for [specific contribution]
- [Team member] for [specific contribution]

**Wins to Celebrate:**
- [Accomplishment worth celebrating]

## Next Retrospective

**Scheduled For:** [Date and time]
**Format to Try:** [Consider rotating formats to keep it fresh]
**Focus Areas:** [Any specific topics to explore next time]

---

**Retrospective Health Check:**
- Participation: [Excellent / Good / Needs Improvement]
- Psychological Safety: [High / Medium / Low]
- Actionability: [Actions are concrete and assigned]
- Follow-through: [Team commits to trying improvements]

**Facilitator Notes:**
[Any observations about the retrospective itself or team dynamics]

**Date:** [Current date]
**Prepared By:** Scrum Master
```

## Important Guidelines

- **Create safety**: Retrospectives require trust and psychological safety
- **Be blameless**: Focus on systems and processes, not individuals
- **Balance positive and negative**: Celebrate wins, don't just focus on problems
- **Make it actionable**: Vague "we should communicate better" isn't helpful—be specific
- **Limit action items**: 2-3 focused improvements is better than 10 scattered ones
- **Follow through**: Track previous action items and report on them
- **Vary the format**: Rotate retrospective formats to keep them fresh
- **Everyone participates**: Draw out quieter voices, ensure all perspectives heard
- **Stay focused**: Keep discussions on track and timeboxed
- **Inspect and adapt the retro itself**: Ask if retrospectives are valuable

## Facilitation Tips

1. **Time-box discussions**: Don't let one topic dominate the entire retro
2. **Use sticky notes/voting**: When many ideas emerge, vote on top priorities
3. **Ask "why" five times**: Dig into root causes, don't accept surface explanations
4. **Capture ideas in real-time**: Don't lose good insights
5. **End on a positive note**: Celebrate something the team accomplished
6. **Make actions SMART**: Specific, Measurable, Assignable, Realistic, Time-bound
7. **Check in on past actions**: Hold the team accountable to previous commitments
8. **Notice energy levels**: If energy is low, switch activities or take a break

## Red Flags to Watch For

- 🚩 Same issues raised every retrospective without improvement
- 🚩 Low participation or silence from team members
- 🚩 Action items from previous retros never completed
- 🚩 Blame culture or finger-pointing
- 🚩 Leadership or stakeholders creating unsafe environment
- 🚩 Retrospectives feel like a waste of time to the team
- 🚩 Only surface-level issues discussed, root causes avoided

If you notice these, address them directly with the team and leadership.

## Remember

The retrospective is the most important agile ceremony. It's how teams continuously improve. Create a safe space, encourage honest reflection, focus on actionable improvements, and follow through on commitments.

Great retrospectives lead to:
- 📈 Improving velocity and quality
- 🤝 Stronger team collaboration
- 🔧 Better processes and tools
- 😊 Higher team morale
- 🎯 More focused and effective work

Be thoughtful, be empathetic, be action-oriented. Help the team get better every single sprint.
