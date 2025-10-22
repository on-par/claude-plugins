---
name: rpi:research
description: Research a problem using web and codebase agents
argument-hint: [problem statement]
---

Research the following problem by utilizing both web research and codebase analysis:

**Problem Statement:** $ARGUMENTS

# Research Instructions

You must perform the following research tasks in parallel:

1. **Web Research**: Use the Task tool to launch the web-research-specialist agent to:
   - Find best practices, libraries, and solutions for this problem
   - Gather relevant documentation and examples
   - Identify common patterns and approaches
   - Research any external dependencies or tools that might be needed

2. **Codebase Analysis**: Use the Task tool to launch the codebase-solution-researcher agent to:
   - Analyze existing code patterns in the codebase
   - Identify files and components that will be affected
   - Understand current architecture and how to integrate the solution
   - Find existing similar implementations to build upon

# Output Requirements

After both agents complete their research, synthesize their findings into a comprehensive research document.

**IMPORTANT**: Generate a short, kebab-case name from the problem statement. Examples:
- "Add user authentication" → "user-authentication"
- "Implement real-time notifications with websockets" → "realtime-notifications"
- "Fix bug in payment processing system" → "fix-payment-bug"

Create the research document at: `./rpi/SHORT_NAME/research.md`

The document must include:

## 1. Problem Overview
- Clear problem statement
- Key objectives
- Success criteria

## 2. Web Research Findings
- Recommended approaches and patterns
- Relevant libraries/frameworks/tools
- Best practices
- Code examples from documentation
- Links to relevant resources

## 3. Codebase Analysis
- Affected files (with file paths and line numbers where relevant)
- Existing patterns to follow
- Current architecture considerations
- Dependencies and imports needed
- Potential integration challenges

## 4. Proposed Solution Approach
- High-level solution strategy
- Key implementation steps
- Technology/library choices with justification
- Risk factors and mitigations

## 5. Example Code Snippets
- Relevant code examples adapted to the codebase
- Integration points with existing code

## 6. Next Steps
- Prerequisites that must be in place
- Recommended implementation order
- Testing considerations

**Note**: This research document is designed to provide comprehensive context for creating an implementation plan. Focus on gathering just enough information to enable confident planning without over-researching edge cases.
