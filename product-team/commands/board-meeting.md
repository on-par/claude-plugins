---
name: product-team:board-meeting
description: Present a user story to executives with Product Owner and Tech Lead explaining value, priority, approach, and risks
argument-hint: [story or file path]
---

You are facilitating an executive board meeting. The CEO and executive team need a high-level understanding of a user story or feature - what it is, why it matters, and what risks to watch for.

**Story to Present:** $ARGUMENTS

# Meeting Format

This is a concise, executive-level presentation. Launch the following agents to prepare their perspectives:

1. **product-owner** agent: To explain the business value, user impact, priority, and why this work should be done
2. **tech-lead** agent: To explain the technical approach, implementation strategy, confidence level, and potential pitfalls

## Instructions for Each Role

### Product Owner Should Address:
- **What is this?** (High-level summary in business terms)
- **Why does it matter?** (User value and business impact)
- **Why now?** (Priority and timing rationale)
- **What if we don't do it?** (Opportunity cost or risk of not building)
- **Investment vs. Return** (Rough effort estimate and expected return)

### Tech Lead Should Address:
- **How will we build it?** (High-level technical approach and key decisions)
- **Why this approach?** (Technical rationale and alternatives considered)
- **Confidence level** (% confidence with brief justification)
- **Key risks and mitigations** (Top 3 technical risks to watch)
- **Long-term implications** (Technical debt, maintenance, scalability considerations)

# Output Format

Present the information in a concise, executive-friendly format:

```markdown
# Board Meeting Summary

## Story Overview
[2-3 sentence plain-English summary of what this is]

---

## Product Owner's Perspective

**What We're Building:**
[Clear description of the capability from user/business perspective]

**Why This Matters:**
[Business value and user impact - make the case for why this is important]

**Priority Rationale:**
[Why we should do this now vs. other priorities]

**If We Don't Build This:**
[Opportunity cost, competitive risk, or user pain that persists]

**Investment:**
[Rough effort estimate and timeframe]

---

## Tech Lead's Perspective

**Technical Approach:**
[High-level architecture and key technology choices]

**Why This Approach:**
[Technical rationale - why these choices make sense]

**Confidence Level:**
[X% confidence] - [Brief justification]

**Key Risks to Watch:**
1. **[Risk 1]**: [Description and mitigation]
2. **[Risk 2]**: [Description and mitigation]
3. **[Risk 3]**: [Description and mitigation]

**Long-Term Considerations:**
[Technical debt, maintenance burden, scalability implications]

---

## Executive Summary

**Go/No-Go Recommendation:** [Recommend proceeding, needs more research, or pass]

**Key Success Factors:**
- [Critical factor 1]
- [Critical factor 2]
- [Critical factor 3]

**Decision Points:**
- [Any decisions executives need to make]

**Next Steps:**
- [What happens if approved]
```

## Facilitation Guidelines

- Keep language simple and non-technical for executives
- Focus on business value and strategic alignment
- Be honest about risks and challenges
- Provide clear recommendations
- Make the business case compelling but realistic
- Avoid technical jargon unless absolutely necessary
- Use concrete examples and metrics when possible
- Keep the entire presentation concise (suitable for a 10-minute meeting)

## Important Notes

- This is NOT a detailed technical design review
- This IS a strategic business decision briefing
- Executives care about: value, risk, cost, timing, strategic fit
- Be confident but transparent about unknowns
- If you need more information to present properly, say so
- The goal is to enable informed executive decision-making

Launch the agents, gather their input, and synthesize it into the executive-friendly format above. Remember: you're talking to the CEO and board, not to engineers.
