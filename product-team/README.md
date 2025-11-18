# Product Team Plugin for Claude Code

Simulate a complete agile product team with specialized agents for different roles and commands for common team activities. Perfect for solo developers who want multiple perspectives, or teams looking to structure their agile ceremonies.

## What is the Product Team Plugin?

This plugin brings together six specialized team member agents and six agile ceremony commands to help you work through product development with diverse perspectives and structured collaboration.

Think of it as having a complete product team at your fingertips—each with their own expertise, concerns, and point of view.

## Features

### Six Specialized Team Member Agents

**Product & Process:**
- **product-owner**: Represents users, defines requirements, sets priorities, validates value
- **scrum-master**: Facilitates ceremonies, removes impediments, drives continuous improvement

**Technical Leadership & Implementation:**
- **tech-lead**: Architecture decisions, code standards, technical strategy, mentorship
- **backend-engineer**: API design, database operations, server-side logic, security
- **frontend-engineer**: UI components, user experience, accessibility, client-side architecture

**Quality Assurance:**
- **qa-engineer**: Test strategy, edge cases, quality criteria, risk analysis

### Six Agile Ceremony Commands

- `/product-team:refine` - Run backlog refinement to turn ideas into well-defined stories
- `/product-team:plan-sprint` - Conduct sprint planning and commit to work
- `/product-team:kickoff` - Align team on technical approach before coding starts
- `/product-team:review` - Demo and validate completed work
- `/product-team:retro` - Reflect and identify improvements
- `/product-team:standup` - Quick daily sync on progress and blockers

## Installation

Install the product-team plugin in Claude Code:

```bash
/plugin install product-team
```

That's it! The plugin will be available immediately.

## Quick Start

### Refine a User Story

Turn a rough idea into a well-defined, ready-to-implement story:

```
/product-team:refine "Add ability for users to export their data to CSV"
```

The team will discuss:
- User value and acceptance criteria (Product Owner)
- Technical approach and complexity (Tech Lead)
- Backend data access and API needs (Backend Engineer)
- UI/UX considerations (Frontend Engineer)
- Edge cases and testing strategy (QA Engineer)

Output: A refined story with clear acceptance criteria, technical notes, and Definition of Done.

### Plan Your Sprint

Select and commit to sprint work with the team:

```
/product-team:plan-sprint "Sprint 42 - Focus on data export features"
```

The team will:
- Present prioritized backlog (Product Owner)
- Assess capacity and velocity (Scrum Master)
- Estimate complexity (Tech Lead, Engineers)
- Identify risks (QA Engineer)

Output: A sprint plan with committed stories, capacity allocation, and dependencies.

### Kick Off a Story

Align on implementation approach before coding:

```
/product-team:kickoff "User story: CSV export functionality"
```

The team will:
- Review requirements (Product Owner)
- Propose technical design (Tech Lead)
- Design APIs and data access (Backend Engineer)
- Plan UI components (Frontend Engineer)
- Define testing strategy (QA Engineer)

Output: Technical approach document with task breakdown and clear next steps.

### Review Completed Work

Demo and validate against acceptance criteria:

```
/product-team:review "CSV export feature implementation"
```

The team will:
- Validate acceptance criteria (Product Owner)
- Verify quality gates (QA Engineer)
- Assess technical quality (Tech Lead)
- Decide if ready to ship

Output: Review summary with acceptance decision and follow-up items.

### Run a Retrospective

Reflect on what went well and what to improve:

```
/product-team:retro "Sprint 42 retrospective"
```

The team will:
- Share what went well (All agents)
- Identify challenges (All agents)
- Propose improvements (Scrum Master facilitates)
- Commit to action items

Output: Retrospective notes with actionable improvements and owners.

### Daily Standup

Quick sync on progress and blockers:

```
/product-team:standup "Daily standup - day 5 of sprint"
```

The team will:
- Share what was completed yesterday
- Share today's plans
- Identify blockers
- Coordinate offline discussions (Scrum Master)

Output: Standup summary with progress, impediments, and action items.

## Command Reference

### `/product-team:refine [story description]`

**Purpose:** Backlog refinement session to turn rough ideas into well-defined stories

**When to use:**
- You have a feature idea that needs clarification
- Story needs clear acceptance criteria
- Need to understand complexity before committing
- Want multiple perspectives on requirements

**Output:** Refined user story with acceptance criteria, technical considerations, edge cases, and Definition of Done

**Example:**
```
/product-team:refine "Users want to be able to filter the dashboard by date range"
```

---

### `/product-team:plan-sprint [sprint context]`

**Purpose:** Sprint planning to select and commit to work

**When to use:**
- Starting a new sprint
- Need to estimate and commit to work
- Want to assess team capacity
- Need to identify dependencies and risks

**Output:** Sprint plan with committed stories, capacity analysis, dependencies, and sprint goal

**Example:**
```
/product-team:plan-sprint "Sprint 15 - Q1 goal: Improve user onboarding"
```

---

### `/product-team:kickoff [story to kick off]`

**Purpose:** Story kickoff to align on technical approach before implementation

**When to use:**
- Before starting development on a story
- Need team alignment on implementation
- Want to coordinate backend/frontend work
- Need to identify technical risks early

**Output:** Technical approach document with API contracts, component design, task breakdown, and testing strategy

**Example:**
```
/product-team:kickoff "As an admin, I want to bulk import users from CSV"
```

---

### `/product-team:review [work to review]`

**Purpose:** Sprint review to demo and validate completed work

**When to use:**
- Work is code-complete and ready for acceptance
- Need Product Owner validation
- Want to gather stakeholder feedback
- Determining if work is ready to ship

**Output:** Review summary with acceptance decision, quality assessment, and follow-up items

**Example:**
```
/product-team:review "User bulk import feature - PR #234"
```

---

### `/product-team:retro [sprint identifier or topic]`

**Purpose:** Sprint retrospective to reflect and improve

**When to use:**
- End of sprint
- Team wants to improve processes
- Need to identify what's working and what's not
- Want to commit to actionable improvements

**Output:** Retrospective notes with what went well, challenges, and action items with owners

**Example:**
```
/product-team:retro "Sprint 15 - retrospective"
```

---

### `/product-team:standup [optional context]`

**Purpose:** Daily standup for quick sync

**When to use:**
- Daily during sprint
- Team needs to coordinate
- Want to identify blockers
- Need visibility on progress

**Output:** Standup summary with team updates, blockers, and coordination needs

**Example:**
```
/product-team:standup "Day 7 of sprint 15"
```

## Agent Details

### product-owner
**Model:** Sonnet | **Color:** Blue | **Tools:** TodoWrite

Represents the voice of the customer and business. Focuses on:
- Defining clear user stories and acceptance criteria
- Prioritizing work based on value
- Validating completed work meets user needs
- Making product decisions

**When to use directly:** Need product perspective, acceptance criteria, prioritization decisions

---

### scrum-master
**Model:** Haiku | **Color:** Yellow | **Tools:** TodoWrite

Servant leader focused on team effectiveness. Focuses on:
- Facilitating agile ceremonies
- Removing impediments
- Ensuring team health
- Driving continuous improvement

**When to use directly:** Need process guidance, facilitation, impediment removal

---

### tech-lead
**Model:** Opus | **Color:** Purple | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Technical leader balancing immediate and long-term needs. Focuses on:
- Architecture and design decisions
- Code standards and quality
- Technical debt management
- Mentoring the team

**When to use directly:** Need architectural guidance, technical decisions, code standards advice

---

### backend-engineer
**Model:** Sonnet | **Color:** Red | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Server-side implementation expert. Focuses on:
- API design and implementation
- Database operations
- Business logic
- Security and performance

**When to use directly:** Need backend implementation, API design, database schema, security guidance

---

### frontend-engineer
**Model:** Sonnet | **Color:** Green | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

User interface implementation expert. Focuses on:
- UI component development
- User experience
- Accessibility
- Client-side architecture

**When to use directly:** Need frontend implementation, component design, UX guidance, accessibility support

---

### qa-engineer
**Model:** Sonnet | **Color:** Orange | **Tools:** Glob, Grep, Read, TodoWrite, Bash

Quality assurance and testing expert. Focuses on:
- Test strategy and planning
- Edge case identification
- Quality criteria
- Risk analysis

**When to use directly:** Need test strategy, edge case analysis, quality assessment, risk evaluation

## Use Cases

### Solo Developer Workflow

As a solo developer, use the plugin to:

1. **Start with an idea:**
   ```
   /product-team:refine "Add dark mode to the application"
   ```
   Get clarity on requirements, technical approach, and edge cases from multiple perspectives.

2. **Plan your work:**
   ```
   /product-team:kickoff "Dark mode feature"
   ```
   Align on implementation strategy before coding.

3. **Validate your work:**
   ```
   /product-team:review "Dark mode implementation"
   ```
   Check your work from product, quality, and technical perspectives.

4. **Improve your process:**
   ```
   /product-team:retro "What can I improve in my workflow?"
   ```
   Reflect on your development process.

### Team Workflow

Use the plugin to structure team discussions:

1. **Prepare for refinement:**
   Run `/product-team:refine` before your live refinement session to identify discussion points

2. **Facilitate sprint planning:**
   Use `/product-team:plan-sprint` to structure the planning conversation

3. **Document kickoffs:**
   Run `/product-team:kickoff` to capture technical alignment

4. **Structure reviews:**
   Use `/product-team:review` as a checklist during sprint reviews

5. **Guide retrospectives:**
   Run `/product-team:retro` to facilitate structured reflection

## Best Practices

### For Solo Developers

- **Use refine early:** Don't skip to implementation; refine ideas first
- **Kickoff before coding:** Align on approach before writing code
- **Review your own work:** Use the review command to catch gaps
- **Regular retros:** Reflect on your process monthly

### For Teams

- **Augment, don't replace:** Use agents to supplement human discussion
- **Document decisions:** Capture outputs in team wiki/docs
- **Iterate on process:** Adapt commands to your team's needs
- **Respect team dynamics:** Agents provide input; humans make decisions

### General Tips

1. **Be specific in commands:** "Add CSV export" vs "Improve data handling"
2. **Read agent outputs:** Don't just run commands; learn from perspectives
3. **Capture artifacts:** Save refined stories, plans, and retro notes
4. **Iterate:** If output isn't helpful, run again with more context
5. **Combine with other plugins:** Use with RPI or other development plugins

## Advanced Usage

### Calling Agents Directly

You can invoke individual agents using the Task tool:

```
Use the tech-lead agent to review the architecture of our authentication system
```

This gives you access to a specific perspective without running a full ceremony.

### Customizing Ceremonies

Modify command files to adapt ceremonies to your team:
- Change time allocations
- Add custom reflection questions
- Adjust output formats
- Include team-specific practices

### Integration with Development Workflow

Combine with the RPI plugin:

1. Research (RPI plugin): `/rpi:research "OAuth implementation"`
2. Refine (Product Team): `/product-team:refine "Add OAuth login"`
3. Plan (RPI plugin): `/rpi:plan ./rpi/oauth/research.md`
4. Kickoff (Product Team): `/product-team:kickoff "OAuth login story"`
5. Implement (RPI plugin): `/rpi:implement-task ./rpi/oauth/plan.md`
6. Review (Product Team): `/product-team:review "OAuth implementation"`

## Philosophy

The Product Team plugin is built on these principles:

**Diverse Perspectives:** Every role brings unique concerns and expertise
**Structured Collaboration:** Agile ceremonies provide proven frameworks
**Documentation:** Decisions and discussions should be captured
**Continuous Improvement:** Teams get better by reflecting and adapting
**User-Centric:** Everything serves the goal of delivering user value

## FAQ

**Q: Do I need a full team to use this plugin?**
A: No! Solo developers benefit from multiple perspectives. It helps you think through problems from different angles.

**Q: Will this replace my team's ceremonies?**
A: No. Use it to structure discussions, document decisions, or prepare for human-led ceremonies.

**Q: Can I modify the agents or commands?**
A: Yes! Fork the plugin and customize to your needs.

**Q: Which model should I use for each agent?**
A: We've pre-configured models based on task complexity, but you can adjust in the agent files.

**Q: How do I know when to use each command?**
A: Follow the agile cadence: refine → plan-sprint → kickoff → (develop) → review → retro. Standup runs daily.

**Q: Can I use this for non-agile workflows?**
A: The agents work independently of ceremonies. You can use individual agents without running full ceremonies.

## Contributing

Contributions are welcome! Ideas for enhancement:

- Additional agent roles (Designer, DevOps Engineer, Data Scientist)
- New ceremony commands (Estimation Poker, Risk Assessment)
- Improved output formats
- Integration with other tools
- Additional retrospective formats

Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Support

- **Issues:** Report bugs or request features via [GitHub Issues](https://github.com/on-par/claude-plugins/issues)
- **Discussions:** Ask questions or share ideas in [GitHub Discussions](https://github.com/on-par/claude-plugins/discussions)

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Author

**Patrick Robinson**
- Website: [patrickarobinson.com](https://patrickarobinson.com)
- GitHub: [@on-par](https://github.com/on-par)
- Email: patrick@onpardev.com

## Acknowledgments

Built with inspiration from real agile teams and the challenges of software development. Special thanks to the agile community for proven practices that informed this plugin.

---

**Version:** 0.1.0
**Status:** Initial Release
**Last Updated:** 2025-01-18
