---
name: product-team:standup
description: Run a daily standup to sync on progress, plans, and blockers
argument-hint: [optional: specific story or context to discuss]
---

You are facilitating a daily standup (daily scrum) for the product team. The goal is a quick sync on what's been done, what's planned, and any blockers—not a detailed status meeting or problem-solving session.

**Standup Context:** $ARGUMENTS

# Daily Standup Process

A daily standup is timeboxed to **15 minutes maximum**. The team gathers (physically or virtually) at the same time each day to synchronize and identify impediments.

## Standup Format

### Classic 3-Question Format

Each team member answers:
1. **What did I complete since the last standup?**
2. **What will I work on until the next standup?**
3. **Are there any blockers or impediments?**

### Alternative: "Walk the Board" Format

- Go through each story/task in progress
- Discuss what's happening with that work
- Identify blockers or help needed

## Standup Agenda

### 1. Set Context (1 min)

Use the **scrum-master** agent to:
- Remind the team of the sprint goal
- Note how many days remain in sprint
- Set the stage for quick, focused updates

### 2. Team Updates (10-12 min)

Use the following agents **sequentially** (one at a time) to provide updates:

**Product Owner** (product-owner agent) - if participating:
- Stakeholder feedback received
- Changes to priorities (if any)
- Upcoming decisions needed from team

**Backend Engineer** (backend-engineer agent):
- Yesterday: [What was completed]
- Today: [What's planned]
- Blockers: [Any impediments]

**Frontend Engineer** (frontend-engineer agent):
- Yesterday: [What was completed]
- Today: [What's planned]
- Blockers: [Any impediments]

**Tech Lead** (tech-lead agent):
- Yesterday: [What was completed]
- Today: [What's planned]
- Blockers: [Any impediments]
- Any architectural decisions needed

**QA Engineer** (qa-engineer agent):
- Yesterday: [What was tested/completed]
- Today: [What's planned for testing]
- Blockers: [Any impediments]
- Quality concerns to raise

### 3. Identify Synchronization Needs (2 min)

Use the **scrum-master** agent to:
- Note if any team members need to sync offline
- Identify pairing opportunities
- Coordinate on blocking dependencies
- Schedule follow-up discussions for complex topics

### 4. Update Impediments List (1 min)

Use the **scrum-master** agent to:
- Capture new blockers
- Update status of existing blockers
- Assign owners to help remove impediments

## Standup Guidelines

**DO:**
- ✅ Keep it to 15 minutes
- ✅ Stay focused on the sprint goal
- ✅ Call out blockers immediately
- ✅ Identify when offline discussion is needed
- ✅ Update task board during or right after standup
- ✅ Stand (if in person) to encourage brevity
- ✅ Start on time, even if not everyone is there

**DON'T:**
- ❌ Turn it into a status report to management
- ❌ Solve problems during standup (take offline)
- ❌ Go into excessive detail
- ❌ Let it run long
- ❌ Skip it because "nothing changed"
- ❌ Let one person dominate the conversation

## When to Go Deeper

If someone mentions a blocker or challenge, ask:
- **Is this blocking you right now?** (Priority: High)
- **Who can help?** (Identify assistance)
- **Should we talk after standup?** (Defer detailed discussion)

Don't solve the problem in standup—identify it and schedule time to address it.

# Output Format

After the standup, create a brief standup summary:

```markdown
# Daily Standup - [Date]

**Sprint:** Sprint [Number] - [Sprint Name]
**Sprint Goal:** [The sprint goal]
**Days Remaining:** [Number] days until sprint end
**Facilitator:** Scrum Master

## Team Updates

### Product Owner
**Focus:** [Current priority or decision needed]
**Notes:** [Any relevant context for the team]

### Backend Engineer
**Completed:**
- [Task/story completed yesterday]

**Today's Plan:**
- [What they'll work on today]

**Blockers:** [None / Description of blocker]

### Frontend Engineer
**Completed:**
- [Task/story completed yesterday]

**Today's Plan:**
- [What they'll work on today]

**Blockers:** [None / Description of blocker]

### Tech Lead
**Completed:**
- [Task/review/decision completed yesterday]

**Today's Plan:**
- [What they'll work on today]

**Blockers:** [None / Description of blocker]
**Decisions Needed:** [Any architectural decisions required]

### QA Engineer
**Completed:**
- [Testing completed yesterday]

**Today's Plan:**
- [Testing planned for today]

**Blockers:** [None / Description of blocker]
**Quality Concerns:** [Any risks or quality issues to raise]

## Sprint Progress

**Stories Completed:** [Number] of [Committed]
**Stories In Progress:** [Number]
**Stories Not Started:** [Number]

**Burn Down Status:** [On Track ✅ / At Risk ⚠️ / Behind ❌]

## Active Impediments

### High Priority (Blocking Work)
1. **[Impediment]**
   - Blocking: [Who/what]
   - Owner: [Who's helping remove it]
   - Status: [New / In Progress / Blocked]
   - Update: [Latest status]

### Medium Priority
1. **[Impediment]**
   - Impact: [How it affects work]
   - Owner: [Who's helping remove it]
   - Status: [Status]

## Resolved Impediments (Since Last Standup)
- ✅ [Impediment that was removed] - [How it was resolved]

## Coordination Needed

**Offline Discussions Scheduled:**
- [Topic]: [Who] will sync after standup
- [Topic]: [Who] will pair on [task]

**Dependencies:**
- [Frontend] waiting on [Backend] to complete [API endpoint]
- [QA] needs [feature] to be deployed to test environment

## Action Items
- [ ] [Scrum Master] - [Action to remove impediment] - Due: [Date]
- [ ] [Team Member] - [Follow-up action] - Due: [Date]

## Sprint Health Indicators

**Velocity Projection:** [On pace / Slightly behind / Significantly behind]
**Team Morale:** [😊 Good / 😐 Neutral / 😟 Concerns]
**Collaboration:** [High / Medium / Low]

## Notes
[Any other relevant information or context]

---
**Next Standup:** [Date and Time]
**Duration:** [Actual duration of standup]
```

## Common Standup Scenarios

### Scenario: Someone is Blocked
**Response:**
- Identify the blocker clearly
- Assign someone to help remove it (often Scrum Master)
- Set a time to discuss it offline
- Update impediments list

### Scenario: Someone Goes Into Too Much Detail
**Response:**
- Politely redirect: "That's good detail for offline. Can you summarize for standup?"
- "Let's discuss that after standup with [relevant people]"
- Keep the team moving

### Scenario: Someone Hasn't Made Progress
**Response:**
- Ask if there's a blocker they haven't mentioned
- See if someone can pair with them
- Determine if the task is bigger than estimated
- Don't shame or blame; focus on how to help

### Scenario: Work Isn't Aligned with Sprint Goal
**Response:**
- Gently remind team of the sprint goal
- Check if the work is necessary or can be deferred
- Discuss with Product Owner if priorities have shifted

### Scenario: Same Blocker Mentioned Multiple Days
**Response:**
- Escalate the impediment
- Scrum Master takes more active role in removal
- Consider if this needs leadership involvement
- Discuss in retrospective why it's not being resolved

## Standup Anti-Patterns

Watch out for these warning signs:

**The Status Report**
- Symptom: Team reporting to Scrum Master or manager, not to each other
- Fix: Remind team this is peer-to-peer sync, not reporting up

**The Problem-Solving Session**
- Symptom: Team diving into solving issues in standup
- Fix: Timebox firmly, defer problem-solving to after standup

**The Long Monologue**
- Symptom: One person talking for 5+ minutes
- Fix: Gently interrupt and ask for summary; schedule offline discussion

**The Delayed Start**
- Symptom: Standup starts 5-10 minutes late regularly
- Fix: Start on time even if people are missing; they'll learn to be on time

**The Zombie Standup**
- Symptom: Low energy, feels like going through motions
- Fix: Mix up the format, walk the board, add a quick team energizer

**The Skip**
- Symptom: Team wants to skip standup because "nothing has changed"
- Fix: Remind team that daily sync is valuable even with small updates

## Remote Standup Tips

For distributed teams:
- Use video when possible (builds connection)
- Use a shared board visible to all
- Rotate who goes first to keep it fresh
- Use async standups (written updates) if time zones don't align
- Record for team members who can't attend live

## Standup Facilitator Checklist

**Before Standup:**
- [ ] Ensure everyone knows the time/location
- [ ] Have task board ready/accessible
- [ ] Review yesterday's impediments

**During Standup:**
- [ ] Start on time
- [ ] Remind team of sprint goal
- [ ] Keep to 15 minutes
- [ ] Track impediments
- [ ] Identify offline discussions needed

**After Standup:**
- [ ] Update impediments list
- [ ] Schedule offline discussions
- [ ] Follow up on action items
- [ ] Update sprint metrics/burndown

## Key Metrics to Track

From standups over time, observe:
- **Blockers**: Are we getting better at removing them quickly?
- **Sprint Progress**: Are we on track to meet the sprint goal?
- **Team Communication**: Are team members coordinating well?
- **Estimation Accuracy**: Are tasks taking longer than expected?

## Remember

The daily standup is about **synchronization**, **transparency**, and **quick problem identification**—not detailed status reporting or problem-solving. Keep it short, keep it focused, and defer deeper discussions to after the standup.

A good standup helps the team:
- 🎯 Stay aligned on the sprint goal
- 🤝 Coordinate and collaborate effectively
- 🚧 Identify and remove blockers quickly
- 📊 Track progress transparently
- ⚡ Maintain momentum

Be punctual, be concise, be helpful. The standup sets the tone for the team's day.
