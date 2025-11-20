---
name: enablement-team:incident-response
description: Coordinate incident response with the enablement team to diagnose, remediate, and document production incidents
argument-hint: [incident description or ticket ID]
---

You are coordinating an incident response for the enablement team. The goal is to quickly diagnose the issue, implement remediation, restore service, and conduct a thorough post-mortem to prevent recurrence.

**Incident:** $ARGUMENTS

# Incident Response Process

Production incidents require rapid response with clear communication and systematic troubleshooting. This process follows industry best practices for incident management and post-mortem analysis.

## Incident Response Workflow

### 1. Incident Assessment & Initial Triage (5-10 min)

Use the **sre** agent (Incident Commander) to:
- Assess incident severity (P0-Critical / P1-High / P2-Medium / P3-Low)
- Determine customer impact and scope
- Establish incident timeline (when did it start?)
- Identify symptoms and initial observations
- Create incident channel/war room
- Assign roles (Incident Commander, Communications Lead, Technical Leads)
- Set up status page update if customer-facing
- Begin incident log for timeline tracking

**Severity Definitions:**
- **P0-Critical:** Service down, data loss, security breach
- **P1-High:** Degraded performance affecting majority of users
- **P2-Medium:** Partial functionality impacted, workaround available
- **P3-Low:** Minor issue, minimal user impact

### 2. System Health Check & Monitoring Analysis (10-15 min)

Use the **sre** agent to:
- Review monitoring dashboards and alerts
- Analyze metrics (CPU, memory, network, error rates, latency)
- Check service health endpoints
- Review recent deployments or changes
- Examine distributed traces for request flows
- Identify anomalies in time-series data
- Check dependency health (upstream/downstream services)
- Review auto-scaling and capacity metrics

### 3. Infrastructure Investigation (15-20 min)

Use the **devops-engineer** agent to:
- Check compute infrastructure status (containers, VMs, serverless functions)
- Review deployment history and recent changes
- Investigate CI/CD pipeline status
- Check container orchestration (ECS, Kubernetes) for pod/task failures
- Review load balancer health checks and target group status
- Investigate network connectivity issues
- Check infrastructure logs for errors
- Review auto-scaling events and capacity

Use the **aws-specialist** or **azure-specialist** agent to:
- Check cloud service health dashboard
- Investigate platform-specific issues (AWS Service Health, Azure Status)
- Review cloud resource limits and quotas
- Check for cloud provider incidents affecting the service
- Investigate networking (VPC, security groups, route tables)
- Review cloud-specific logs (CloudTrail, Azure Activity Log)

### 4. Database Investigation (15-20 min)

Use the **db-admin** agent to:
- Check database health and connectivity
- Review slow query logs and query performance
- Check database connection pool status
- Investigate locking or deadlock issues
- Review replication lag (if applicable)
- Check database resource utilization (CPU, IOPS, storage)
- Analyze recent schema changes or migrations
- Review backup and transaction log status
- Investigate data integrity issues

### 5. Security Analysis (10-15 min)

Use the **security-engineer** agent to:
- Investigate potential security incidents (unauthorized access, data breach)
- Review authentication and authorization failures
- Check for DDoS or abnormal traffic patterns
- Analyze WAF logs and blocked requests
- Review security group or firewall changes
- Check for compromised credentials or secrets
- Investigate audit logs for suspicious activity
- Assess whether this is a security incident requiring separate response

### 6. Log Analysis & Root Cause Investigation (20-30 min)

Use the **devops-engineer** and **sre** agents to:
- Aggregate logs from all service components
- Search for error patterns and stack traces
- Correlate logs with metric anomalies
- Identify the first occurrence of the issue
- Trace request paths through distributed systems
- Identify common factors in failed requests
- Review third-party service logs and status pages
- Formulate root cause hypothesis

### 7. Remediation & Recovery (15-45 min)

Use the **sre** agent to coordinate and the relevant specialist agents to implement:

**Immediate Mitigation:**
- Implement workaround to restore service
- Rollback recent deployment if needed
- Scale up resources if capacity issue
- Enable rate limiting or circuit breakers
- Redirect traffic or enable maintenance mode
- Clear caches or restart services if appropriate

**Root Cause Fix:**
- Implement code fix if application bug
- Adjust configuration if misconfiguration
- Fix database query or schema issue
- Update infrastructure if infrastructure issue
- Patch security vulnerability if security incident

**Verification:**
- Confirm service restoration via monitoring
- Validate fix doesn't introduce new issues
- Test critical user workflows
- Monitor error rates and latency for 30+ minutes
- Confirm customer impact is resolved

### 8. Post-Incident Review & Documentation (30-60 min)

Use the **sre** agent to facilitate:
- Complete incident timeline with all key events
- Document root cause analysis
- Capture remediation steps taken
- Identify contributing factors
- Create action items to prevent recurrence
- Schedule blameless post-mortem meeting
- Update runbooks and documentation
- Share incident report with stakeholders

# Output Format

After the incident is resolved, create a comprehensive incident report:

```markdown
# Incident Report: [Incident Title]

## Incident Summary

**Incident ID:** [INC-YYYY-MM-DD-XXX]
**Severity:** [P0/P1/P2/P3]
**Status:** [Investigating / Mitigating / Resolved / Closed]
**Duration:** [X hours Y minutes] (Detection to Resolution)
**Customer Impact:** [Description of user-facing impact]

**Start Time:** [YYYY-MM-DD HH:MM:SS UTC]
**Detection Time:** [YYYY-MM-DD HH:MM:SS UTC]
**Mitigation Time:** [YYYY-MM-DD HH:MM:SS UTC]
**Resolution Time:** [YYYY-MM-DD HH:MM:SS UTC]

**MTTR (Mean Time to Recover):** [X minutes]
**MTTD (Mean Time to Detect):** [Y minutes]

## Impact Analysis

**Services Affected:**
- [Service Name]: [Status and impact]
- [Service Name]: [Status and impact]

**User Impact:**
- Total users affected: [Number or percentage]
- Geographic regions: [Regions affected]
- Impact description: [What users experienced]
- Customer complaints: [Number of support tickets]

**Business Impact:**
- Revenue impact: [Estimated $ if applicable]
- SLA breach: [Yes/No - which SLO]
- Regulatory/compliance: [Any implications]

## Incident Timeline

**Detection and Response:**
- **[HH:MM UTC]** - Alert triggered: [Alert name/description]
- **[HH:MM UTC]** - Incident acknowledged by on-call SRE
- **[HH:MM UTC]** - Incident declared P[X], war room established
- **[HH:MM UTC]** - Initial investigation began
- **[HH:MM UTC]** - Status page updated: "Investigating"

**Investigation:**
- **[HH:MM UTC]** - Checked monitoring dashboards, observed [symptoms]
- **[HH:MM UTC]** - Reviewed recent deployments, found [deployment X]
- **[HH:MM UTC]** - Analyzed logs, identified [error pattern]
- **[HH:MM UTC]** - Database team joined, investigated [database issue]
- **[HH:MM UTC]** - Root cause hypothesis formed: [hypothesis]

**Mitigation:**
- **[HH:MM UTC]** - Decision made to [mitigation action]
- **[HH:MM UTC]** - Mitigation implemented: [specific action]
- **[HH:MM UTC]** - Service partially restored, error rate decreased
- **[HH:MM UTC]** - Status page updated: "Monitoring"

**Resolution:**
- **[HH:MM UTC]** - Permanent fix deployed: [description]
- **[HH:MM UTC]** - Service fully restored, metrics normalized
- **[HH:MM UTC]** - Monitoring period completed, no further issues
- **[HH:MM UTC]** - Incident declared resolved
- **[HH:MM UTC]** - Status page updated: "Resolved"

## Root Cause Analysis

### What Happened

[Detailed technical explanation of what went wrong]

**Trigger:**
[What initiated the incident - deployment, traffic spike, configuration change, external dependency failure, etc.]

**Root Cause:**
[The fundamental reason the incident occurred]

**Contributing Factors:**
- [Factor 1: e.g., Insufficient monitoring coverage]
- [Factor 2: e.g., Lack of automated rollback]
- [Factor 3: e.g., Missing rate limiting]

### Why It Happened

**Technical Details:**
[Deep dive into the technical root cause with code snippets, config, or architecture diagrams if helpful]

**Example:**
```
The incident was caused by a database connection pool exhaustion.
A deployment at 14:23 UTC introduced a code change that failed to properly
close database connections in error handling paths. Under normal load,
connections were recycled fast enough. However, a marketing campaign started
at 14:45 UTC, doubling traffic. The leaked connections accumulated until the
pool was exhausted at 15:10 UTC, causing all new requests to fail with
"Cannot acquire connection" errors.
```

### System Behavior

**Before Incident:**
- [Normal operating state]

**During Incident:**
- [System behavior during the incident]
- [Cascading failures if any]

**After Mitigation:**
- [System state after fix]

## Resolution Details

### Immediate Mitigation

**Action Taken:**
[Describe the workaround or immediate fix]

**Command/Change:**
```bash
# Example command executed
kubectl scale deployment api-service --replicas=10
```
or
```
Rolled back deployment from v2.5.3 to v2.5.2 via AWS ECS console
```

**Result:**
[Outcome of the mitigation]

### Permanent Fix

**Code Changes:**
- Repository: [repo name]
- Pull Request: [PR link]
- Commit: [commit hash]
- Description: [What was changed]

**Configuration Changes:**
- Configuration file: [path]
- Change: [before → after]

**Infrastructure Changes:**
- Resource: [resource name]
- Change: [what was modified]

**Deployment:**
- Deployed at: [timestamp]
- Deployment method: [CI/CD, manual, IaC]
- Verification: [how fix was validated]

## What Went Well

- ✅ [Positive aspect 1 - e.g., Alert fired within 2 minutes]
- ✅ [Positive aspect 2 - e.g., Quick team mobilization]
- ✅ [Positive aspect 3 - e.g., Clear communication with stakeholders]

## What Went Poorly

- ❌ [Issue 1 - e.g., No automated rollback capability]
- ❌ [Issue 2 - e.g., Insufficient test coverage for error paths]
- ❌ [Issue 3 - e.g., Delayed customer communication]

## Action Items

### Prevent Recurrence (High Priority)

- [ ] **[Action Item 1]** - Owner: [Name] - Due: [Date]
  - Description: [Detailed description]
  - Success criteria: [How we know it's done]

- [ ] **[Action Item 2]** - Owner: [Name] - Due: [Date]
  - Description: [Detailed description]
  - Success criteria: [How we know it's done]

### Improve Detection (Medium Priority)

- [ ] **[Action Item 3]** - Owner: [Name] - Due: [Date]
  - Description: [e.g., Add monitoring for connection pool usage]

- [ ] **[Action Item 4]** - Owner: [Name] - Due: [Date]
  - Description: [e.g., Create alert for abnormal error rate patterns]

### Improve Response (Medium Priority)

- [ ] **[Action Item 5]** - Owner: [Name] - Due: [Date]
  - Description: [e.g., Create runbook for database connection issues]

- [ ] **[Action Item 6]** - Owner: [Name] - Due: [Date]
  - Description: [e.g., Implement automated rollback on health check failure]

### Process Improvements (Low Priority)

- [ ] **[Action Item 7]** - Owner: [Name] - Due: [Date]
  - Description: [e.g., Update deployment checklist]

## Lessons Learned

**Technical Lessons:**
- [Lesson 1: e.g., Always close resources in finally blocks]
- [Lesson 2: e.g., Load testing should include error injection scenarios]

**Process Lessons:**
- [Lesson 3: e.g., Status page updates should happen within 10 minutes]
- [Lesson 4: e.g., Deployment windows should avoid marketing campaign launches]

**Organizational Lessons:**
- [Lesson 5: e.g., Need better coordination between engineering and marketing]

## Supporting Data

### Monitoring Graphs

[Links to relevant dashboards and graphs]
- Error Rate: [link to graph]
- Latency: [link to graph]
- Database Connections: [link to graph]

### Log Excerpts

```
[Timestamp] ERROR DatabasePool: Failed to acquire connection, pool exhausted
[Timestamp] ERROR APIHandler: Request timeout after 30s
[Timestamp] WARN HealthCheck: Database health check failed
```

### Related Incidents

- [INC-2024-01-15-001]: Similar connection pool issue - [Link]
- [INC-2023-11-03-045]: Related deployment rollback - [Link]

## Communication

**Internal Communication:**
- Incident channel: [#incident-20250119]
- Participants: [List of team members involved]
- Executive notification: [Yes/No - when]

**External Communication:**
- Status page: [Link to status page updates]
- Customer emails: [Number sent, template used]
- Support tickets: [Number of tickets related to incident]

## Post-Mortem Meeting

**Scheduled:** [Date and Time]
**Attendees:** [List of required attendees]
**Agenda:**
1. Review timeline
2. Discuss root cause
3. Review what went well / poorly
4. Finalize action items
5. Assign ownership and deadlines

## Sign-Off

**Incident Commander:** [Name] - [Date]
**Technical Lead:** [Name] - [Date]
**Engineering Manager:** [Name] - [Date]

**Post-Mortem Completed:** [Yes/No]
**All Action Items Assigned:** [Yes/No]
**Runbooks Updated:** [Yes/No]

---

**Report Version:** 1.0
**Last Updated:** [Timestamp]
**Document Owner:** [SRE Team]
```

## Important Guidelines

- **Severity first**: Accurately assess severity to determine response urgency
- **Communicate constantly**: Update stakeholders every 30 minutes during active incidents
- **Timebox investigations**: Don't spend 30 minutes investigating if a 5-minute rollback restores service
- **Mitigate first, root cause later**: Restore service, then investigate fully
- **Blameless culture**: Focus on systems and processes, not individuals
- **Parallel investigation**: Launch multiple agents simultaneously to investigate different layers
- **Document everything**: Capture timeline as events happen, not after the fact
- **Customer focus**: Prioritize customer impact over technical curiosity
- **Action-oriented post-mortems**: Every incident should result in preventative action items
- **Follow up**: Track action items to completion; incomplete action items lead to repeat incidents

## Incident Communication Template

**Initial Update (within 10 minutes):**
```
We are investigating reports of [issue]. Customers may experience [impact].
Our team is actively working on resolution. Updates every 30 minutes.
```

**Progress Update (every 30 minutes):**
```
We have identified the issue as [brief description]. We are implementing a fix.
Current impact: [description]. ETA: [time estimate if known].
```

**Resolution Update:**
```
The issue has been resolved. Services are now operating normally.
Root cause was [brief description]. We will provide a full post-mortem within 48 hours.
```

## Success Criteria

A successful incident response results in:
- ✅ Service restored quickly (within MTTR targets)
- ✅ Clear understanding of root cause
- ✅ Comprehensive incident timeline documented
- ✅ Customer communication was timely and clear
- ✅ Action items created to prevent recurrence
- ✅ Team learning captured in blameless post-mortem
- ✅ Runbooks and monitoring updated
- ✅ SLA/SLO impact understood

The goal is not just to fix the immediate issue, but to improve the system so the same incident cannot happen again. A good post-mortem generates actionable improvements, not just documentation.
