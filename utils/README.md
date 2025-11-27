# Utils Plugin

Utility agents and skills for system maintenance, troubleshooting, and GitHub operations.

## Overview

The Utils plugin provides specialized agents and skills that help you maintain a clean development environment and interact with GitHub efficiently.

## Skills

### github-cli

GitHub CLI (`gh`) operations for issues, PRs, and repository management.

**Triggers on:**
- "Get Issue #123"
- "Review PR #456"
- "Create PR"
- "List issues"
- "Check PR status"
- "Merge PR"

**Capabilities:**
- View and manage issues (create, close, comment)
- Review and manage pull requests (view, diff, approve, merge)
- Check CI/CD status and PR reviews
- Access repository information and releases
- Generic GitHub API access for advanced queries

**Example usage:**
```
Get Issue #42
```
```
Review PR #123
```
```
Create an issue for the login bug we just discussed
```

## Agents

### node-killer

Find and terminate orphaned or hanging Node.js processes that are consuming resources or blocking ports.

**Use cases:**
- Port conflicts from forgotten dev servers
- High CPU/memory usage from orphaned processes
- Cleaning up after interrupted testing sessions
- General Node.js process maintenance

**Example usage:**
```
I can't start my dev server because port 3000 is already in use.
```

The agent will:
1. Find all running Node.js processes
2. Display detailed information (PID, command, resource usage)
3. Identify likely orphaned or hanging processes
4. Recommend which processes to terminate
5. Safely kill the processes after confirmation
6. Verify successful termination

**Tools available:** Bash, TodoWrite
**Model:** haiku (fast and efficient for system tasks)

## Installation

```bash
/plugin install utils@on-par
```

## When to Use

Use the Utils plugin agents when you need to:
- Clean up your development environment
- Troubleshoot resource usage issues
- Resolve port conflicts
- Maintain system health during development
- Recover from interrupted development sessions

## Safety Features

All utility agents prioritize safety:
- Always request user confirmation before making changes
- Provide clear explanations of what will be affected
- Use graceful termination methods first
- Report all actions taken and their results
- Never modify system-critical processes without explicit approval

## Future Agents

The Utils plugin is designed to grow with additional maintenance and troubleshooting agents as needed. Potential future additions might include:
- Docker cleanup utilities
- Port management tools
- Log file analyzers
- Dependency cleanup helpers
- And more based on community needs

## Contributing

Contributions are welcome! If you have ideas for new utility agents, please open an issue or submit a pull request.

## License

MIT License - see [LICENSE](./LICENSE) for details.
