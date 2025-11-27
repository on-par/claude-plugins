# Utils Plugin

Utility agents for system maintenance and troubleshooting in your development environment.

## Overview

The Utils plugin provides specialized agents that help you maintain a clean and efficient development environment. Each agent focuses on a specific maintenance or troubleshooting task, making it easy to keep your system running smoothly.

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
