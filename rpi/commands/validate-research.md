---
name: rpi:validate-research
description: Validates research using the FAR Scale.
argument-hint: [research.md file]
---

Validates research findings against the FAR Scale to determine readiness for the Plan phase. Use this as a clear, reproducible rubric and checklist when reviewing a research.md file.

**Input:** research markdown file (full text, links, citations, artifacts)  
**Output:** PASS with confirmation, or FAIL with specific, prioritized improvement suggestions and a short remediation plan

How to use
1. Read the research document end-to-end (problem statement, methods, evidence, conclusions, artifacts).  
2. For each FAR dimension (Factual, Actionable, Relevant) assign an integer 0–5 with a short justification (1–2 sentences and at least one concrete evidence pointer: quote, link, or artifact reference).  
3. Compute Mean = (F + A + R) / 3, round to two decimal places.  
4. Apply Pass Criteria and produce either PASS or FAIL with required next steps.

FAR Scale — guidance and evidence required for each score
- Factual (F)
    - 0 Fabricated: Claims contradicted by primary sources or internally inconsistent. Evidence required: contradictions, missing provenance.
    - 1 Rumor: Unsupported assertions, anonymous claims, or hearsay. Evidence required: no citations or unverifiable sources.
    - 2 Single-source: One source cited or a single interview. Evidence required: citation with clear scope and limitations.
    - 3 Provisionally credible: Multiple sources but gaps remain; tentative verification. Evidence required: partial corroboration and note of outstanding unknowns.
    - 4 Corroborated: Independent sources align; methods and provenance documented. Evidence required: 2+ independent citations, data snapshots, logs.
    - 5 Strongly verified: Primary data, reproducible methods, third-party validation. Evidence required: raw data, analysis scripts, independent replication or authoritative citation.

- Actionable (A)
    - 0 No action: No next steps or implications identified.
    - 1 Vague/long-term: High-level suggestions with no owner, timeline, or metrics.
    - 2 Directional, heavy lift: Suggests direction but requires major research or resources; lacks immediate first steps.
    - 3 Concrete next step: Clear next experiment or deliverable with owner and approximate effort estimate.
    - 4 Clear, low-friction plan: Specific tasks, owners, dependencies, and measurable success criteria; minimal effort blockers.
    - 5 Immediate, high-leverage: Ready-to-execute items that produce measurable impact within a short timeframe; includes templates or scripts.

- Relevant (R)
    - 0 Off-topic: Findings unrelated to the stated problem or scope.
    - 1 Tangential: Weak connection to objectives; peripheral information.
    - 2 Adjacent: Related but does not address core success criteria.
    - 3 On-theme: Addresses the stated problem and primary metrics.
    - 4 Core + timely: Central to decision and time-sensitive; directly supports planning.
    - 5 Bullseye for now: Precisely targeted evidence that reduces key uncertainty immediately.

Scoring format (required)
```
F: [0-5]  A: [0-5]  R: [0-5]  Mean: [X.XX]  --> [PASS/FAIL]
```
Include one-line justification for each numeric score and at least one “evidence pointer” (quote, section heading, filename, or URL).

Pass criteria (explicit)
- F ≥ 4, A ≥ 3, R ≥ 3
- Mean Score ≥ 4.00

Pass message
- On PASS: "✓ Research validated. Ready for Plan phase." Also include: list of linked artifacts that support the pass (data files, transcripts, scripts), and recommended immediate Plan kickoff items (owner, first meeting agenda, 1-week milestones).

Fail output requirements
- Identify which dimension(s) failed threshold and why (one-sentence diagnosis per failed dimension).  
- Provide 3 prioritized, concrete improvements to reach threshold with estimated effort and owner for each improvement. Each improvement should be actionable (e.g., "Run A/B survey with N=50 using template X; owner: @team; effort: 2 days") and include acceptance criteria tied to rubric thresholds.  
- If Mean < 4.00 but individual dims meet thresholds, recommend focused enrichment steps to raise mean (e.g., add primary data or refine next steps).

Suggested remediation checklist (use in FAIL reports)
- For Factual shortfall: add primary data, attach raw logs, list sources, add replication steps, or obtain third-party validation.
- For Actionable shortfall: convert recommendations into a 1–2 sprint backlog with owners, success metrics, and minimal viable experiment definitions.
- For Relevant shortfall: reframe findings to the project objective or remove off-topic sections; add explicit mapping to success criteria.

Reporting template (append to validated file)
- Summary line with scoring format.  
- 1–2 sentence overall recommendation (PASS/FAIL + quick rationale).  
- Per-dimension: score, 1–2 sentence justification, evidence pointer.  
- If FAIL: prioritized improvements with owner and acceptance criteria.  
- Attach checklist of artifacts reviewed.

Example (concise)
F: 4  A: 3  R: 4  Mean: 3.67  --> FAIL  
- Diagnosis: Mean < 4.00 despite meeting most thresholds; factual evidence present but needs stronger primary-data links.  
- Improvements: 1) Attach raw survey CSV and analysis script (owner, 1 day). 2) Add one replication interview and transcript (owner, 2 days). 3) Convert findings into a 2-step experiment plan with owners and metrics (owner, 1 day).

Notes
- Be explicit about provenance: when a claim is based on an interview, name the interview artifact and date.  
- Keep judgments evidence-based and include pointers so reviewers or authors can immediately act.  
- Use this rubric to produce reproducible, auditable decisions about readiness for the Plan phase.
