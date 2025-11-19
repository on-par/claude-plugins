# On-Par Claude Plugins Marketplace

A curated collection of Claude Code plugins designed to enhance your development workflows with structured methodologies and specialized tools.

## Available Plugins

| Plugin | Version | Description |
|--------|---------|-------------|
| [RPI](./rpi/) | 0.3.0 | Research-Planning-Implementation strategy for disciplined software development |
| [Product Team](./product-team/) | 0.5.0 | Agile product team simulation plugin with specialized agents for different roles and commands for common team activities |

## Quick Start

Add the marketplace:
```bash
/plugin marketplace add on-par@claude-plugins
```

Install any plugin from this marketplace:

```bash
/plugin install <plugin-name>@on-par
```

Example:
```bash
/plugin install rpi@on-par
```

## What is a Plugin Marketplace?

A Claude Code plugin marketplace is a collection of plugins that extend Claude's capabilities with:

- **Custom Commands**: Slash commands for specific workflows
- **Specialized Agents**: Purpose-built AI agents for focused tasks
- **Structured Methodologies**: Enforced best practices and development patterns
- **Team Standards**: Shareable, consistent approaches across projects

## Why Use This Marketplace?

- **Curated Quality**: Each plugin is tested and documented
- **Consistent Patterns**: Plugins follow common design principles
- **Easy Installation**: Single command to add powerful workflows
- **Open Source**: Inspect, modify, and contribute improvements

## Contributing

We welcome high-quality plugin contributions! To add a plugin:

1. Fork this repository
2. Create your plugin directory with the required structure:
   ```
   your-plugin/
   ├── .claude-plugin/
   │   └── plugin.json
   ├── agents/          # (optional)
   ├── commands/        # (optional)
   ├── README.md
   └── LICENSE
   ```
3. Update `.claude-plugin/marketplace.json`
4. Submit a pull request

See individual plugin READMEs for contribution guidelines specific to each plugin.

## Support

- **Issues**: [GitHub Issues](https://github.com/on-par/claude-plugins/issues)
- **Discussions**: [GitHub Discussions](https://github.com/on-par/claude-plugins/discussions)
- **Documentation**: [Claude Code Plugin Docs](https://docs.claude.com/claude-code)
