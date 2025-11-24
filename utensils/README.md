# Utensils Plugin

Minimal, single-purpose agents following the Unix philosophy: **each does one thing well**.

## Philosophy

Like utensils at a dinner table, each agent is a specialized tool:
- A **fork** picks up food - it doesn't cut or scoop
- A **knife** cuts - it doesn't pick up or scoop
- A **spoon** scoops - it doesn't cut or pick up

Similarly, these agents have **strictly limited tools** - they cannot do things outside their specialty, forcing composition over complexity.

## Agents

| Agent | Tools | Purpose |
|-------|-------|---------|
| `reader` | Read | Read file contents |
| `writer` | Write, Edit | Write/edit file contents |
| `searcher` | Glob, Grep | Find files and content |
| `runner` | Bash | Execute shell commands |
| `refactorer` | Read, Edit | Improve code structure |
| `linter` | Bash | Run lint/static analysis |
| `test-writer` | Read, Write | Write tests for code |

## Usage

Invoke agents through the Task tool:

```
Task(subagent_type="utensils:reader", prompt="Read src/config.ts")
Task(subagent_type="utensils:searcher", prompt="Find all TypeScript files")
Task(subagent_type="utensils:runner", prompt="Run npm test")
```

## Commands

Pre-built workflows that orchestrate agents in pipelines:

| Command | Pipeline | Purpose |
|---------|----------|---------|
| `/utensils:refactor` | searcher → reader → refactorer → linter → runner | Safely refactor code with verification |
| `/utensils:add-tests` | searcher → reader → test-writer → runner | Add tests for existing code |
| `/utensils:find-and-replace` | searcher → reader → writer → runner | Search and replace across files |
| `/utensils:lint-fix` | linter → reader → writer → linter | Find and fix lint issues |

### Example Usage

```bash
# Refactor a specific file
/utensils:refactor src/utils/helpers.ts

# Add tests for a module
/utensils:add-tests src/services/auth.ts

# Rename a function across the codebase
/utensils:find-and-replace getUserData → fetchUserProfile

# Fix all lint issues in a directory
/utensils:lint-fix src/
```

## Composition Example

To refactor code safely (what `/utensils:refactor` does):

1. **searcher** - Find the file to refactor
2. **reader** - Read and understand current code
3. **refactorer** - Make structural improvements
4. **linter** - Check code quality
5. **runner** - Run tests to verify

Each agent does its part, then hands off to the next.

## Why Constraints?

1. **Focus**: Limited tools mean clearer purpose
2. **Safety**: Agents can't accidentally do harm outside their scope
3. **Composability**: Simple agents combine into complex workflows
4. **Debuggability**: Easy to trace what each agent did
5. **Reliability**: Fewer tools = fewer failure modes

## Agent Details

### reader
**Tools**: `Read`

Reads file contents. Cannot search, modify, or execute.

### writer
**Tools**: `Write`, `Edit`

Writes or edits files. Must be given exact content - cannot read first.

### searcher
**Tools**: `Glob`, `Grep`

Finds files by pattern or content. Cannot read full files or modify anything.

### runner
**Tools**: `Bash`

Executes shell commands. Reports output. Cannot read/write files directly.

### refactorer
**Tools**: `Read`, `Edit`

Reads code, makes targeted edits to improve structure. Cannot write new files or run tests.

### linter
**Tools**: `Bash`

Runs linting/static analysis tools. Reports issues. Cannot fix them.

### test-writer
**Tools**: `Read`, `Write`

Reads code to understand behavior, writes test files. Cannot run tests.

## Design Principles

1. **One Thing Well**: Each agent has a single, clear purpose
2. **Minimal Tools**: Only the tools absolutely necessary
3. **No Overlap**: Agents don't duplicate each other's capabilities
4. **Clear Boundaries**: What an agent can't do is as important as what it can
5. **Composition Over Features**: Build complex behavior by combining simple agents
