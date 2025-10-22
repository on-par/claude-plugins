# RPI Plugin for Claude Code

A structured methodology plugin that implements the **Research-Planning-Implementation (RPI)** strategy for disciplined software development.

## What is RPI?

The RPI strategy is a systematic approach to software development that prevents common pitfalls like premature implementation, insufficient planning, and missed requirements. It enforces a three-phase workflow:

1. **Research (R)**: Thoroughly understand the problem, existing solutions, and relevant patterns
2. **Planning (P)**: Create detailed implementation plans with clear tasks and acceptance criteria
3. **Implementation (I)**: Execute the plan with precision and testing

Read more at [patrickarobinson.com/blog/introducing-rpi-strategy](https://patrickarobinson.com/blog/introducing-rpi-strategy/)

## Features

### Four Specialized Agents

- **codebase-solution-researcher**: Deep codebase exploration to understand existing patterns and solutions
- **web-research-specialist**: Research external documentation, libraries, and best practices
- **software-task-planner**: Break down requirements into detailed, actionable implementation plans
- **task-implementer**: Execute implementation tasks with precision and testing

### Five Workflow Commands

- `/rpi:research` - Run the Research phase
- `/rpi:plan` - Run the Planning phase
- `/rpi:implement-task` - Execute a specific task from your plan
- `/rpi:implement-phase` - Execute a specific phase (R, P, or I)
- `/rpi:implement` - Run the complete RPI workflow

## Installation

Install the RPI plugin in Claude Code:

```bash
/plugin install rpi
```

That's it! The plugin will be available immediately.

## Quick Start

### Step-by-Step Workflow

For more control, use individual phase commands:

```markdown
# Phase 1: Research
/rpi:research "user authentication with OAuth"
# Creates: ./rpi/user-auth-with-oauth/research.md

# Clear context window for better results
/clear

# Phase 2: Planning
/rpi:plan @./rpi/user-auth-with-oauth/research.md
# Creates: ./rpi/user-auth-with-oauth/plan.md

# Phase 3a: Implementation (Single Task)
/rpi:implement-task @./rpi/user-auth-with-oauth/plan.md
# Executes next unchecked task in plan.md file

# Phase 3b: Implementation (Single Phase/Multiple Tasks)
/rpi:implement-phase @./rpi/user-auth-with-oauth/plan.md
# Executes next unchecked phase in plan.md file

# Phase 3c: Implementation (Entire Plan)*
/rpi:implement-phase @./rpi/user-auth-with-oauth/plan.md
# Executes entire plan
*Not recommended for complex plans
```

## Command Reference

### `/rpi:research [description]`

Conducts thorough research on a topic by:
- Exploring your codebase for existing patterns and solutions
- Researching external documentation and best practices
- Creating a comprehensive research report

**Example:**
```
/rpi:research "how pagination is currently implemented"
```

**Output:** `./rpi/pagination/research.md`

---

### `/rpi:plan @./rpi/pagination/research.md`

Creates a detailed implementation plan by:
- Analyzing research findings (if available)
- Breaking down requirements into specific tasks
- Identifying dependencies and acceptance criteria
- Considering architectural implications

**Example:**
```
/rpi:plan @.rpi/pagination/research.md
```

**Output:** `./rpi/pagination/plan.md`

---

### `/rpi:implement-task @./rpi/pagination/plan.md`

Executes next available task:
- Reads relevant plan documents
- Implements the task following established patterns
- Writes tests
- Documents changes

---

### `/rpi:implement-phase @./rpi/pagination/plan.md`

Executes next available phase of tasks:
- Reads relevant plan documents
- Implements the tasks within the available phase following established patterns
- Writes tests
- Documents changes

---

### `/rpi:implement @./rpi/pagination/plan.md`

Executes all tasks within the plan, from start to finish, using subagents.

**Example:**
```
/rpi:implement "add rate limiting to API endpoints"
```

This is the most comprehensive command and ensures all phases are completed systematically.

## Artifact Organization

The plugin creates a `./rpi/` directory in your project to store all artifacts:

```
./rpi/
├── research/
│   └── 2025-01-15-14-30-auth-research.md
├── plans/
│   └── 2025-01-15-15-00-auth-plan.md
└── implementation/
    └── 2025-01-15-16-30-oauth-implementation.md
```

These artifacts serve as:
- Historical record of decisions
- Reference material for future work
- Documentation for team members
- Context for AI assistants

## Agent Details

### codebase-solution-researcher

**Purpose**: Deep codebase exploration to find patterns and solutions

**Capabilities**:
- Systematic file and code pattern search
- Identification of architectural patterns
- Documentation of code references with `file:line` notation
- Analysis of existing implementations

**Output Format**:
- Overview of findings
- Key patterns identified
- Relevant code locations
- Architectural observations
- Recommendations

---

### web-research-specialist

**Purpose**: Research external resources and best practices

**Capabilities**:
- Documentation lookup for libraries and frameworks
- Best practice research
- Security consideration analysis
- Comparison of approaches

**Output Format**:
- Summary of findings
- Recommendations with rationale
- Links to relevant documentation
- Code examples from documentation
- Security and performance considerations

---

### software-task-planner

**Purpose**: Create detailed, actionable implementation plans

**Capabilities**:
- Requirements breakdown into tasks
- Dependency identification
- Acceptance criteria definition
- Risk assessment

**Output Format**:
- Task list with priorities
- Dependencies and order
- Acceptance criteria per task
- Estimated complexity
- Potential risks

---

### task-implementer

**Purpose**: Execute implementation tasks with precision

**Capabilities**:
- Clean code implementation
- Test writing
- Pattern following
- Documentation updates

**Behavioral Guidelines**:
- Follows established codebase patterns
- Writes tests alongside implementation
- Commits frequently with clear messages
- Documents complex logic

## Best Practices

### When to Use Each Command

- **Use `/rpi:research`** when:
  - Starting a new feature or refactoring
  - Unfamiliar with the codebase area
  - Need to understand existing patterns
  - Evaluating different approaches

- **Use `/rpi:plan`** when:
  - Research is complete

- **Use `/rpi:implement-task`** when:
  - Have a clear plan
  - Executing individual tasks
  - Want granular control
  - Working through a task list
  - Want shorter feedback loops with code

- **Use `/rpi:implement-phase`** when:
  - Have a clear plan
  - Executing phase of tasks
  - Want some control
  - Working through a task list
  - Are okay with small to medium feedback loops with code

- **Use `/rpi:implement`** when:
  - Have a clear plan
  - The plan is not overly complex
  - You're okay with a huge diff all at once

### Tips for Success

1. **Don't skip research**: Even if you think you know the solution, research reveals patterns and prevents duplicate work
2. **Be specific in descriptions**: "Add OAuth" vs "Add OAuth 2.0 authentication with Google provider"
3. **Review artifacts**: Read the generated research and plans before implementation - a bad research file can lead to thousands of bad lines of code
4. **Keep artifacts**: They're valuable documentation for your team - remove them after features are stabilized (probably a sprint or two)
5. **Iterate**: Use research findings to inform better plans


## License

MIT License - see [LICENSE](./LICENSE) for details.

## Author

**Patrick Robinson**
- Website: [patrickarobinson.com](https://patrickarobinson.com)
- Blog: [RPI Strategy](https://patrickarobinson.com/blog/introducing-rpi-strategy/)

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Support

- **Issues**: Report bugs or request features via [GitHub Issues](https://github.com/on-par/claude-plugins/issues)
- **Discussions**: Ask questions or share ideas in [GitHub Discussions](https://github.com/on-par/claude-plugins/discussions)
