---
name: enablement-team:design-infrastructure
description: Design infrastructure architecture for a new service or system with the enablement team
argument-hint: [service or system to design infrastructure for]
---

You are leading an infrastructure design session for the enablement team. The goal is to create a comprehensive, scalable, and secure infrastructure architecture before implementation begins.

**Service/System to Design:** $ARGUMENTS

# Infrastructure Design Process

An infrastructure design session typically takes 2-4 hours and involves the full enablement team collaborating to create a complete architecture that addresses compute, storage, networking, security, monitoring, and cost.

## Design Workflow

### 1. Requirements Gathering & Initial Architecture (30-45 min)

Use the **devops-engineer** agent to:
- Understand service requirements (compute, storage, networking)
- Propose initial high-level architecture
- Identify deployment strategy (containers, VMs, serverless)
- Define CI/CD pipeline approach
- Suggest Infrastructure as Code (IaC) tooling (Terraform, CloudFormation, etc.)
- Outline automation opportunities
- Estimate resource requirements

### 2. Cloud Platform Design (30-45 min)

Use the **aws-specialist** or **azure-specialist** agent (based on target platform) to:
- Design cloud-native architecture using platform services
- Select appropriate compute services (EC2/ECS/EKS/Lambda or VM/AKS/Functions)
- Design storage solutions (S3/EBS/RDS or Blob/Disk/SQL Database)
- Plan networking (VPC/subnets/security groups or VNet/NSG)
- Define service integration patterns
- Recommend managed services vs. self-hosted
- Design for high availability and disaster recovery
- Provide cost optimization recommendations
- Reference architecture diagrams and best practices

### 3. Database Architecture (20-30 min)

Use the **db-admin** agent to:
- Select appropriate database technology (relational, NoSQL, cache)
- Design database schema and data model
- Plan for scalability (read replicas, sharding, partitioning)
- Define backup and recovery strategy
- Plan database migrations and version control
- Estimate storage and IOPS requirements
- Design connection pooling and access patterns
- Plan for data retention and archival

### 4. Site Reliability & Monitoring (30-45 min)

Use the **sre** agent to:
- Define SLIs, SLOs, and SLAs for the service
- Design observability stack (metrics, logs, traces)
- Plan monitoring and alerting strategy
- Design for reliability and resilience (circuit breakers, retries, timeouts)
- Plan capacity and performance testing
- Define incident response procedures
- Design chaos engineering experiments
- Estimate operational overhead and on-call requirements
- Plan runbooks and operational documentation

### 5. Security & Compliance (30-45 min)

Use the **security-engineer** agent to:
- Conduct threat modeling for the architecture
- Design authentication and authorization (IAM, RBAC, service accounts)
- Plan secrets management (AWS Secrets Manager, Azure Key Vault, HashiCorp Vault)
- Define network security (security groups, NACLs, WAF, DDoS protection)
- Plan encryption (at rest, in transit)
- Design audit logging and compliance controls
- Identify security scanning and vulnerability management
- Plan security testing (SAST, DAST, dependency scanning)
- Define compliance requirements (SOC 2, HIPAA, PCI-DSS, GDPR)

### 6. Cost Analysis & Optimization (15-20 min)

Use the **devops-engineer** and cloud specialist agents to:
- Estimate monthly infrastructure costs
- Identify cost optimization opportunities
- Plan for auto-scaling and right-sizing
- Recommend reserved instances or savings plans
- Estimate cost by environment (dev, staging, prod)

### 7. Review & Finalization (15-30 min)

Use the **sre** agent to facilitate:
- Review complete architecture for gaps
- Validate against requirements
- Identify risks and dependencies
- Create implementation roadmap
- Prioritize tasks and phases
- Assign ownership for implementation

# Output Format

After the design session, create a comprehensive architecture design document:

```markdown
# Infrastructure Architecture Design: [Service/System Name]

## Executive Summary

**Service Description:**
[Brief overview of what the service does and why we need it]

**Architecture Overview:**
[High-level description of the proposed architecture]

**Key Decisions:**
- **Cloud Platform:** [AWS/Azure/GCP/Multi-cloud]
- **Compute Strategy:** [Containers/VMs/Serverless/Hybrid]
- **IaC Tooling:** [Terraform/CloudFormation/Pulumi/ARM]
- **Database:** [Technology and topology]
- **Estimated Monthly Cost:** $[amount] (production environment)

## Architecture Diagram

```
[ASCII diagram or reference to architecture diagram]
Example:
┌─────────────────────────────────────────────────┐
│              Load Balancer (ALB/App Gateway)     │
└─────────────────┬───────────────────────────────┘
                  │
         ┌────────┴─────────┐
         │                  │
    ┌────▼────┐        ┌────▼────┐
    │ Web App │        │ Web App │
    │ Tier    │        │ Tier    │
    │ (ECS/   │        │ (ECS/   │
    │  AKS)   │        │  AKS)   │
    └────┬────┘        └────┬────┘
         │                  │
         └────────┬─────────┘
                  │
         ┌────────▼─────────┐
         │   Application    │
         │   Tier (API)     │
         └────────┬─────────┘
                  │
         ┌────────┴─────────┐
         │                  │
    ┌────▼────┐        ┌────▼────┐
    │ Primary │        │  Cache  │
    │   DB    │◄──────►│ (Redis/ │
    │ (RDS/   │        │ ElastiC)│
    │  SQL)   │        │         │
    └────┬────┘        └─────────┘
         │
    ┌────▼────┐
    │ Read    │
    │ Replica │
    └─────────┘
```
```

## Detailed Component Design

### Compute Infrastructure

**Service Type:** [ECS/EKS/App Service/AKS/VMs/Lambda/Functions]

**Configuration:**
- Instance type: [e.g., t3.medium, Standard_D2s_v3]
- Auto-scaling: Min: [X], Max: [Y], Target CPU: [Z%]
- Availability zones: [Multi-AZ deployment strategy]

**Container/Application Details:**
- Base image: [e.g., node:18-alpine, python:3.11-slim]
- Resource limits: CPU: [X vCPU], Memory: [Y GB]
- Health check: [Endpoint and configuration]

**IaC Modules:**
```hcl
# Example Terraform module structure
modules/
  compute/
    ecs-service.tf
    autoscaling.tf
    task-definition.tf
```

### Networking Architecture

**VPC/VNet Configuration:**
- CIDR: [10.0.0.0/16]
- Public subnets: [10.0.1.0/24, 10.0.2.0/24] (AZ-a, AZ-b)
- Private subnets: [10.0.11.0/24, 10.0.12.0/24] (AZ-a, AZ-b)
- Database subnets: [10.0.21.0/24, 10.0.22.0/24] (AZ-a, AZ-b)

**Load Balancing:**
- Type: [Application Load Balancer / Application Gateway]
- SSL/TLS: [Certificate source and configuration]
- WAF: [Enabled/Disabled, rules]

**Security Groups/NSG:**
```
Web Tier:
- Inbound: 443 from 0.0.0.0/0 (HTTPS)
- Outbound: 443 to App Tier SG

App Tier:
- Inbound: 8080 from Web Tier SG
- Outbound: 3306 to DB SG, 6379 to Cache SG

Database:
- Inbound: 3306/5432 from App Tier SG only
- Outbound: None
```

### Database Architecture

**Primary Database:**
- Engine: [PostgreSQL 15 / MySQL 8.0 / SQL Server 2022]
- Instance class: [db.r6g.xlarge / Standard_D4s_v3]
- Storage: [500 GB, gp3, 3000 IOPS]
- Multi-AZ: [Yes/No]
- Backup retention: [7 days]

**Read Replicas:**
- Count: [2]
- Lag tolerance: [< 5 seconds]
- Read traffic distribution: [Round-robin / Weighted]

**Caching Layer:**
- Technology: [Redis / Memcached]
- Instance: [cache.r6g.large]
- Cluster mode: [Enabled/Disabled]
- Use cases: [Session data, API responses, database query cache]

**Schema Management:**
- Migration tool: [Flyway / Liquibase / Alembic / EF Migrations]
- Version control: Git repository path
- Migration strategy: [Blue-green / Rolling / Maintenance window]

### Storage Architecture

**Object Storage:**
- Service: [S3 / Azure Blob Storage]
- Buckets/Containers:
  - `app-static-assets`: Static files, public read
  - `app-user-uploads`: User-generated content, private
  - `app-backups`: Database and application backups, versioned
- Lifecycle policies: [Archive to Glacier/Cool tier after 90 days]

**Block Storage:**
- Type: [EBS gp3 / Azure Premium SSD]
- Use cases: [Application logs, temporary data]
- Backup: [EBS snapshots daily]

### CI/CD Pipeline

**Pipeline Stages:**
1. **Source:** Git push triggers pipeline (GitHub/GitLab/Bitbucket)
2. **Build:**
   - Docker image build
   - Dependency scanning
   - SAST (static analysis)
3. **Test:**
   - Unit tests
   - Integration tests
   - Security scanning (Trivy/Snyk)
4. **Deploy:**
   - Deploy to dev (automatic)
   - Deploy to staging (automatic)
   - Deploy to prod (manual approval)

**Tools:**
- CI/CD: [GitHub Actions / GitLab CI / Azure DevOps / Jenkins]
- Container registry: [ECR / ACR / Docker Hub]
- Artifact storage: [S3 / Azure Artifacts]

**IaC Pipeline:**
- Tool: [Terraform Cloud / GitHub Actions + Terraform]
- State management: [S3 + DynamoDB / Azure Storage + Lock]
- Plan on PR, Apply on merge to main
- Separate state files per environment

### Observability & Monitoring

**Metrics:**
- Platform: [CloudWatch / Azure Monitor / Prometheus + Grafana]
- Key metrics:
  - Application: Request rate, error rate, latency (p50, p95, p99)
  - Infrastructure: CPU, memory, disk, network
  - Database: Connections, query performance, replication lag
  - Business: [Domain-specific metrics]
- Dashboards: [Links to dashboard definitions]

**Logging:**
- Platform: [CloudWatch Logs / Azure Monitor Logs / ELK / Datadog]
- Log aggregation: Centralized logging from all services
- Retention: 30 days hot, 1 year archive
- Log levels: INFO (prod), DEBUG (dev/staging)

**Tracing:**
- Platform: [AWS X-Ray / Azure Application Insights / Jaeger / Datadog APM]
- Sampling rate: [1% production, 100% dev/staging]
- Instrumentation: [OpenTelemetry SDK]

**Alerting:**
- Platform: [CloudWatch Alarms / Azure Alerts / PagerDuty / Opsgenie]
- Critical alerts:
  - Service availability < 99.9%
  - Error rate > 1%
  - P95 latency > 500ms
  - Database connection pool > 80%
- On-call rotation: [PagerDuty schedule]

### Site Reliability

**SLIs (Service Level Indicators):**
- Availability: % of successful requests (non-5xx)
- Latency: P95 response time
- Error rate: % of requests returning errors

**SLOs (Service Level Objectives):**
- Availability: 99.9% (43 minutes downtime/month)
- Latency: P95 < 300ms
- Error rate: < 0.1%

**SLA (Service Level Agreement):**
- Availability: 99.5% (customer-facing commitment)
- Support response time: < 1 hour for critical issues

**Error Budget:**
- 0.1% error budget per month
- Burn rate alerts at 2x and 10x expected rate

**Capacity Planning:**
- Current capacity: [X requests/sec]
- Projected growth: [Y% per quarter]
- Headroom: [Z% buffer for traffic spikes]
- Scaling triggers: CPU > 70% or Request count > X/min

**Disaster Recovery:**
- RTO (Recovery Time Objective): [4 hours]
- RPO (Recovery Point Objective): [15 minutes]
- Backup strategy: [Automated daily backups, cross-region replication]
- DR drill frequency: [Quarterly]

### Security Architecture

**Authentication & Authorization:**
- User authentication: [OAuth 2.0 / SAML / JWT]
- Service authentication: [IAM roles / Managed identities / Service principals]
- Authorization model: [RBAC / ABAC]
- MFA: [Required for production access]

**Secrets Management:**
- Service: [AWS Secrets Manager / Azure Key Vault / HashiCorp Vault]
- Rotation: [Automatic 90-day rotation]
- Access control: [Principle of least privilege via IAM]

**Network Security:**
- Public internet → WAF → Load Balancer (public subnet)
- Load Balancer → App tier (private subnet)
- App tier → Database (private subnet, isolated)
- Egress: Via NAT Gateway/NAT (for external API calls)
- VPN/Private connectivity: [Site-to-Site VPN / ExpressRoute / Direct Connect] for internal tools

**Encryption:**
- At rest: [AES-256, all storage encrypted]
- In transit: [TLS 1.3 minimum]
- Database: [Transparent Data Encryption enabled]
- Backups: [Encrypted with KMS/Key Vault]

**Compliance & Audit:**
- Audit logging: [CloudTrail / Azure Activity Log]
- Compliance framework: [SOC 2 Type II / HIPAA / PCI-DSS]
- Security scanning:
  - SAST: [SonarQube / GitHub Advanced Security]
  - DAST: [OWASP ZAP]
  - Dependency scanning: [Snyk / Dependabot]
  - Container scanning: [Trivy / Prisma Cloud]
- Vulnerability management: [Weekly scans, 30-day remediation SLA for critical]

**Threat Model:**
- Threats identified: [DDoS, SQL injection, unauthorized access, data breach]
- Mitigations: [Rate limiting, input validation, WAF rules, encryption]

### Cost Analysis

**Monthly Cost Estimate (Production):**

| Component | Service | Configuration | Monthly Cost |
|-----------|---------|---------------|--------------|
| Compute | [ECS/AKS] | [X instances, Y size] | $[amount] |
| Load Balancer | [ALB/App Gateway] | [Z LCUs] | $[amount] |
| Database | [RDS/SQL Database] | [Instance + storage] | $[amount] |
| Cache | [ElastiCache/Redis] | [Instance] | $[amount] |
| Storage | [S3/Blob] | [X GB] | $[amount] |
| Networking | [Data transfer] | [Y GB/month] | $[amount] |
| Monitoring | [CloudWatch/Monitor] | [Metrics + logs] | $[amount] |
| **Total** | | | **$[total]** |

**Cost Optimization Strategies:**
- Reserved instances: [20% savings on compute]
- Auto-scaling: [Right-size during off-peak]
- S3 lifecycle: [Move to cheaper tiers after 90 days]
- Monitoring data retention: [Reduce retention for non-critical logs]

**Cost by Environment:**
- Development: $[amount] (~20% of prod)
- Staging: $[amount] (~40% of prod)
- Production: $[total]
- **Total: $[sum]**

## Infrastructure as Code

**Repository Structure:**
```
infrastructure/
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   ├── staging/
│   │   └── prod/
│   ├── modules/
│   │   ├── networking/
│   │   ├── compute/
│   │   ├── database/
│   │   ├── monitoring/
│   │   └── security/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── scripts/
│   ├── deploy.sh
│   └── rollback.sh
└── docs/
    ├── architecture.md
    └── runbooks/
```

**IaC Best Practices:**
- Separate state per environment
- Use remote state with locking
- Module versioning for stability
- Automated plan on PR, apply on merge
- Drift detection daily

## Implementation Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Set up IaC repository and structure
- [ ] Create networking infrastructure (VPC, subnets, security groups)
- [ ] Set up IAM roles and permissions
- [ ] Configure secrets management
- [ ] Set up monitoring and logging foundation

### Phase 2: Core Services (Week 3-4)
- [ ] Deploy database infrastructure
- [ ] Set up compute platform (ECS/AKS)
- [ ] Configure load balancer
- [ ] Deploy cache layer
- [ ] Set up storage buckets

### Phase 3: CI/CD (Week 5)
- [ ] Build CI/CD pipeline
- [ ] Configure container registry
- [ ] Set up automated deployments
- [ ] Implement IaC pipeline

### Phase 4: Observability (Week 6)
- [ ] Configure detailed monitoring dashboards
- [ ] Set up alerting rules
- [ ] Implement distributed tracing
- [ ] Create runbooks

### Phase 5: Security Hardening (Week 7)
- [ ] Complete security scanning integration
- [ ] Implement WAF rules
- [ ] Conduct penetration testing
- [ ] Complete compliance audit

### Phase 6: Production Readiness (Week 8)
- [ ] Load testing and performance tuning
- [ ] DR drill and validation
- [ ] Documentation review
- [ ] Production deployment

## Risks & Dependencies

### Technical Risks

**Risk:** Database performance under load
- **Impact:** High - Could affect user experience
- **Likelihood:** Medium
- **Mitigation:** Load testing, read replicas, query optimization, caching

**Risk:** Cost overruns
- **Impact:** Medium - Budget constraints
- **Likelihood:** Medium
- **Mitigation:** Cost monitoring alerts, reserved instances, auto-scaling policies

### Dependencies

**Internal:**
- [ ] Cloud account provisioned - Owner: [Name] - Due: [Date]
- [ ] Network team: Peering/VPN setup - Owner: [Name] - Due: [Date]
- [ ] Security team: Compliance approval - Owner: [Name] - Due: [Date]

**External:**
- [ ] Cloud provider quota increases - Owner: [Name] - Due: [Date]
- [ ] Third-party API access - Owner: [Name] - Due: [Date]

## Operational Runbooks

### Deployment Procedure
1. Run IaC plan and review changes
2. Get approval from team lead
3. Apply changes during maintenance window
4. Verify deployment via health checks
5. Monitor for 1 hour post-deployment

### Rollback Procedure
1. Identify last known good state
2. Run IaC rollback (previous state version)
3. Verify rollback success
4. Document incident and root cause

### Scaling Procedure
- Auto-scaling handles most scenarios
- Manual scaling: Update auto-scaling group max capacity
- Monitor for 30 minutes after manual scale

### Incident Response
1. Alert received via PagerDuty
2. Acknowledge within 5 minutes
3. Assess severity (P0-P3)
4. Follow service-specific runbook
5. Escalate if needed
6. Post-incident review within 48 hours

## Review & Approval

**Architecture Review:**
- [ ] DevOps Engineer: [Name]
- [ ] SRE: [Name]
- [ ] Security Engineer: [Name]
- [ ] Database Admin: [Name]
- [ ] Cloud Specialist: [Name]

**Approval Status:** [Pending/Approved]
**Date:** [Current date]
**Next Review:** [Date - quarterly]

---

**Design Session Facilitator:** [SRE Lead]
**Participants:** DevOps Engineer, SRE, Cloud Specialist (AWS/Azure), Database Admin, Security Engineer
**Document Version:** 1.0
```

## Important Guidelines

- **Launch agent consultations in parallel** when possible for efficiency
- **Be platform-specific**: Use actual service names (ECS not "containers", RDS not "database service")
- **Provide concrete numbers**: Don't say "scalable" - specify min/max/target scaling values
- **Include diagrams**: ASCII art or references to visual architecture diagrams
- **Think production-ready**: Address monitoring, security, DR, cost from the start
- **Use IaC best practices**: Everything should be codified, versioned, and automated
- **Consider day-2 operations**: How will this be maintained, monitored, and updated?
- **Security by default**: Every component should have encryption, minimal permissions, audit logging

## Success Criteria

A successful infrastructure design results in:
- ✅ Complete architecture addressing all infrastructure layers
- ✅ Specific cloud service selections with justification
- ✅ Security and compliance controls defined
- ✅ Monitoring and observability plan in place
- ✅ Cost estimates and optimization strategies
- ✅ IaC approach and structure defined
- ✅ Implementation roadmap with clear phases
- ✅ Operational procedures and runbooks outlined
- ✅ Team alignment on architecture and approach

The architecture should be production-ready, secure, observable, cost-effective, and maintainable. If there are unknowns, identify them clearly and plan for validation before full implementation.
