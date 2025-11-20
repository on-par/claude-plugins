---
name: enablement-team:onboard-service
description: Onboard a new service to production with the enablement team, ensuring infrastructure, CI/CD, monitoring, and security are fully configured
argument-hint: [service name or description]
---

You are coordinating the onboarding of a new service to production with the enablement team. The goal is to ensure the service is deployed with all necessary infrastructure, automation, monitoring, security controls, and operational procedures in place.

**Service to Onboard:** $ARGUMENTS

# Service Onboarding Process

Onboarding a new service to production requires coordinated effort across infrastructure, CI/CD, databases, security, and reliability. This process ensures services meet production standards before they serve customer traffic.

## Onboarding Workflow

### 1. Service Requirements & Planning (30-45 min)

Use the **devops-engineer** agent to:
- Understand service requirements (compute, storage, dependencies)
- Review service architecture and technology stack
- Identify service type (web app, API, worker, batch job)
- Determine deployment environments needed (dev, staging, prod)
- Plan infrastructure requirements
- Identify service dependencies (internal services, external APIs)
- Estimate resource requirements and cost
- Define success criteria for onboarding

### 2. Infrastructure Provisioning (45-60 min)

Use the **devops-engineer** agent to:
- Create IaC modules for the service (Terraform, CloudFormation, etc.)
- Set up compute resources (containers, VMs, serverless)
- Configure networking (VPC, subnets, security groups)
- Set up load balancing and auto-scaling
- Create service accounts and IAM roles
- Configure environment-specific resources (dev, staging, prod)
- Document infrastructure architecture

Use the **aws-specialist** or **azure-specialist** agent to:
- Provision cloud-specific resources
- Configure cloud platform integrations
- Set up managed services (queues, caching, object storage)
- Configure service discovery and DNS
- Set up cross-region or multi-zone deployment if required
- Optimize cloud resource configuration
- Validate cloud best practices

### 3. Database Setup (30-45 min)

Use the **db-admin** agent to:
- Provision database instances (if new database needed)
- Create database schemas and users
- Set up connection pooling configuration
- Configure database backups and retention
- Set up read replicas if needed
- Create database migration pipeline
- Configure database monitoring and slow query logging
- Document database connection details and credentials location
- Plan database capacity and scaling strategy

### 4. CI/CD Pipeline Configuration (45-60 min)

Use the **devops-engineer** agent to:
- Create CI/CD pipeline configuration (GitHub Actions, GitLab CI, Jenkins, etc.)
- Configure build process (Docker image build, artifact creation)
- Set up automated testing in pipeline (unit, integration tests)
- Configure security scanning (SAST, dependency scanning, container scanning)
- Set up deployment stages (dev → staging → prod)
- Configure deployment strategy (rolling, blue-green, canary)
- Set up automated rollback on health check failure
- Configure approval gates for production deployment
- Create deployment runbook
- Document pipeline stages and deployment process

**Pipeline Stages:**
```yaml
# Example CI/CD Pipeline
stages:
  1. Build:
     - Checkout code
     - Build Docker image
     - Run unit tests
     - SAST scanning

  2. Test:
     - Deploy to test environment
     - Run integration tests
     - Security scanning (container, dependencies)

  3. Deploy Dev:
     - Deploy to dev environment (automatic)
     - Run smoke tests

  4. Deploy Staging:
     - Deploy to staging (automatic)
     - Run E2E tests
     - Performance testing

  5. Deploy Production:
     - Manual approval required
     - Deploy to prod (canary or blue-green)
     - Health check validation
     - Gradual traffic ramp
     - Automatic rollback on failure
```

### 5. Monitoring & Observability Setup (45-60 min)

Use the **sre** agent to:
- Define service SLIs, SLOs, and SLAs
- Set up metrics collection (application and infrastructure metrics)
- Configure log aggregation and retention
- Set up distributed tracing
- Create monitoring dashboards
- Configure alerting rules and thresholds
- Set up on-call rotation and escalation
- Define error budget and burn rate alerts
- Create service runbooks for common issues
- Document monitoring and alerting strategy

**Key Metrics to Monitor:**
- Application: Request rate, error rate, latency (p50, p95, p99)
- Infrastructure: CPU, memory, disk, network
- Business: Service-specific KPIs
- Dependencies: External API health and latency

**Alerting Priorities:**
- P0: Service down, high error rate (> 5%), SLO breach
- P1: Degraded performance, elevated error rate (> 1%)
- P2: Warning thresholds, resource utilization high
- P3: Informational, non-urgent issues

### 6. Security Hardening (45-60 min)

Use the **security-engineer** agent to:
- Configure authentication and authorization
- Set up secrets management (store credentials in Secrets Manager/Key Vault)
- Configure encryption (at rest and in transit)
- Set up network security (security groups, WAF if applicable)
- Configure audit logging
- Set up security scanning in CI/CD
- Conduct threat modeling review
- Implement rate limiting and DDoS protection
- Configure CORS and security headers (if web service)
- Review and approve production deployment
- Document security controls and compliance requirements

**Security Checklist:**
- [ ] Secrets in secure vault (not in code/env files)
- [ ] TLS/SSL configured (minimum TLS 1.2)
- [ ] IAM roles follow least privilege principle
- [ ] Security groups allow only necessary traffic
- [ ] Audit logging enabled
- [ ] Dependency scanning in CI/CD
- [ ] Container scanning in CI/CD
- [ ] Rate limiting configured
- [ ] Input validation implemented
- [ ] Authentication and authorization tested

### 7. Reliability & Capacity Planning (30-45 min)

Use the **sre** agent to:
- Define capacity requirements and scaling thresholds
- Configure auto-scaling policies
- Set up health checks and readiness probes
- Plan disaster recovery and backup strategy
- Define RTO (Recovery Time Objective) and RPO (Recovery Point Objective)
- Conduct load testing
- Plan chaos engineering experiments
- Create incident response runbook
- Document operational procedures
- Review production readiness

### 8. Final Review & Go-Live (15-30 min)

Use all agents to review:
- **DevOps Engineer**: Infrastructure and CI/CD complete and tested
- **SRE**: Monitoring, alerting, and runbooks in place
- **DB Admin**: Database configured, backed up, and monitored
- **Security Engineer**: Security controls validated and approved
- **Cloud Specialist**: Cloud resources optimized and compliant

**Go-Live Checklist:**
- [ ] All infrastructure provisioned and tested
- [ ] CI/CD pipeline tested end-to-end
- [ ] Monitoring and alerting validated
- [ ] Security controls in place
- [ ] Load testing completed successfully
- [ ] Runbooks created
- [ ] On-call rotation configured
- [ ] Production deployment approved
- [ ] Rollback procedure tested

# Output Format

After completing service onboarding, create a comprehensive onboarding checklist and documentation:

```markdown
# Service Onboarding: [Service Name]

## Service Overview

**Service Name:** [Name]
**Description:** [What this service does]
**Technology Stack:** [Languages, frameworks, runtime]
**Service Type:** [Web App / API / Worker / Batch Job / Event Processor]
**Team Owner:** [Team name]
**On-Call Rotation:** [PagerDuty/Opsgenie schedule]

**Environments:**
- Development: [URL/endpoint]
- Staging: [URL/endpoint]
- Production: [URL/endpoint]

**Repository:** [Git repository URL]
**Documentation:** [Wiki/Confluence link]

## Onboarding Status

**Overall Status:** [In Progress / Ready for Production / Live]
**Onboarding Start Date:** [Date]
**Target Go-Live Date:** [Date]
**Actual Go-Live Date:** [Date if completed]

## Infrastructure Setup

### Compute Resources

**Platform:** [ECS / EKS / App Service / AKS / Lambda / Functions]

**Development Environment:**
- Instance type: [e.g., t3.small]
- Instances: [count]
- Auto-scaling: [Min/Max]
- Status: ✅ Complete

**Staging Environment:**
- Instance type: [e.g., t3.medium]
- Instances: [count]
- Auto-scaling: [Min/Max]
- Status: ✅ Complete

**Production Environment:**
- Instance type: [e.g., t3.large]
- Instances: [count]
- Auto-scaling: Min: [X], Max: [Y], Target CPU: [Z%]
- Status: ✅ Complete

### Networking

**VPC/VNet:** [VPC ID / VNet name]
**Subnets:**
- Private: [subnet IDs]
- Public: [subnet IDs if applicable]

**Load Balancer:**
- Type: [ALB / NLB / Application Gateway]
- DNS: [Load balancer DNS]
- Health check: [Path and configuration]
- Status: ✅ Complete

**Security Groups:**
- Service SG: [sg-xxxxx] - [Description of rules]
- Database SG: [sg-xxxxx] - [Description of rules]
- Status: ✅ Complete

### Service Discovery

**DNS:** [service.domain.com]
**Service Mesh:** [Istio / Linkerd / App Mesh / None]
**Status:** ✅ Complete

### IaC Configuration

**IaC Tool:** [Terraform / CloudFormation / Pulumi / ARM Templates]
**Repository:** [Path to IaC code]
**State Management:** [S3 + DynamoDB / Azure Storage / Terraform Cloud]

**Modules:**
- `modules/networking/`: VPC, subnets, security groups
- `modules/compute/`: ECS services, task definitions
- `modules/storage/`: S3 buckets, EBS volumes
- `modules/database/`: RDS configuration

**Status:** ✅ Complete

## Database Configuration

### Primary Database

**Database Type:** [PostgreSQL / MySQL / MongoDB / SQL Server / DynamoDB]
**Instance:** [db instance identifier]
**Instance Class:** [db.r6g.large]
**Storage:** [500 GB, gp3]
**Multi-AZ:** [Yes/No]

**Connection Details:**
- Endpoint: [database endpoint]
- Port: [5432 / 3306 / etc.]
- Database name: [db_name]
- Connection pool size: [20]

**Credentials Location:** [AWS Secrets Manager / Azure Key Vault secret name]

**Status:** ✅ Complete

### Read Replicas

**Count:** [2]
**Lag Tolerance:** [< 5 seconds]
**Status:** ✅ Complete / ⏳ Not Needed

### Backups

**Automated Backups:** [Enabled]
**Retention:** [7 days]
**Backup Window:** [03:00-04:00 UTC]
**Point-in-time Recovery:** [Enabled]
**Status:** ✅ Complete

### Migrations

**Migration Tool:** [Flyway / Liquibase / Alembic / EF Migrations]
**Migrations Repository:** [Path to migrations]
**Deployment:** [Automatic via CI/CD]
**Status:** ✅ Complete

## CI/CD Pipeline

### Pipeline Configuration

**CI/CD Platform:** [GitHub Actions / GitLab CI / Azure DevOps / Jenkins]
**Pipeline File:** [.github/workflows/deploy.yml]

### Build Stage

- [x] Checkout code
- [x] Build Docker image
- [x] Run unit tests (coverage > 80%)
- [x] Run linting and code quality checks
- [x] SAST scanning (SonarQube / Checkmarx)
- [x] Push image to container registry

**Container Registry:** [ECR / ACR / Docker Hub]
**Image Name:** [registry/service-name]

**Status:** ✅ Complete

### Test Stage

- [x] Deploy to test environment
- [x] Run integration tests
- [x] Dependency scanning (Snyk / Dependabot)
- [x] Container scanning (Trivy / Prisma Cloud)
- [x] Security vulnerability check

**Status:** ✅ Complete

### Deployment Stages

**Dev Deployment:**
- Trigger: Automatic on commit to `develop`
- Environment: Development
- Smoke tests: [Enabled]
- Status: ✅ Complete

**Staging Deployment:**
- Trigger: Automatic on commit to `main`
- Environment: Staging
- Tests: Integration + E2E tests
- Performance testing: [Yes]
- Status: ✅ Complete

**Production Deployment:**
- Trigger: Manual approval + tag creation
- Environment: Production
- Strategy: [Blue-Green / Canary / Rolling]
- Approval required: [Engineering Manager + SRE]
- Health check validation: [5 minutes]
- Automatic rollback: [Enabled on health check failure]
- Status: ✅ Complete

### Rollback Procedure

**Automatic Rollback:**
- Triggered by: Health check failure for 3 consecutive checks
- Rollback target: Previous stable version
- Notification: [PagerDuty alert + Slack]

**Manual Rollback:**
```bash
# Rollback command
./scripts/rollback.sh [service-name] [version]
```

**Status:** ✅ Tested

## Monitoring & Observability

### Metrics

**Metrics Platform:** [CloudWatch / Azure Monitor / Prometheus + Grafana / Datadog]

**Application Metrics:**
- Request rate (requests/sec)
- Error rate (percentage)
- Latency (p50, p95, p99)
- Status code distribution
- Business metrics: [service-specific]

**Infrastructure Metrics:**
- CPU utilization
- Memory utilization
- Network throughput
- Disk usage
- Container/pod count

**Dashboard:** [Link to primary dashboard]
**Status:** ✅ Complete

### Logging

**Logging Platform:** [CloudWatch Logs / Azure Monitor Logs / ELK / Datadog]

**Log Aggregation:**
- Application logs: Centralized
- Infrastructure logs: Centralized
- Access logs: Centralized
- Audit logs: Centralized

**Log Retention:**
- Hot storage: 30 days
- Archive: 1 year

**Log Format:** [JSON structured logging]

**Search/Query:** [Link to log search interface]
**Status:** ✅ Complete

### Distributed Tracing

**Tracing Platform:** [AWS X-Ray / Azure Application Insights / Jaeger / Datadog APM]
**Sampling Rate:** [1% production, 100% dev/staging]
**Instrumentation:** [OpenTelemetry SDK / Platform SDK]
**Status:** ✅ Complete

### Alerting

**Alerting Platform:** [CloudWatch Alarms / Azure Alerts / PagerDuty / Opsgenie]

**Critical Alerts (P0):**
- [ ] Service availability < 99.5% (5-minute window)
- [ ] Error rate > 5% (5-minute window)
- [ ] P99 latency > 2000ms
- [ ] Health check failures

**High Priority Alerts (P1):**
- [ ] Error rate > 1% (10-minute window)
- [ ] P95 latency > 1000ms
- [ ] CPU > 90% for 10 minutes
- [ ] Memory > 90% for 10 minutes
- [ ] Database connection pool > 90%

**Warning Alerts (P2):**
- [ ] Error rate > 0.5%
- [ ] Disk usage > 80%
- [ ] SSL certificate expiring in 30 days

**On-Call Rotation:** [PagerDuty schedule link]
**Escalation Policy:** [Escalation path]
**Status:** ✅ Complete

### SLIs, SLOs, SLAs

**SLI (Service Level Indicators):**
- Availability: % of successful requests (non-5xx)
- Latency: P95 response time
- Error rate: % of requests with errors

**SLO (Service Level Objectives):**
- Availability: 99.9% (43 minutes downtime/month)
- Latency: P95 < 500ms
- Error rate: < 0.1%

**SLA (Service Level Agreement):**
- Availability: 99.5% (customer commitment)
- Support response: < 1 hour for P0 incidents

**Error Budget:**
- Monthly error budget: 0.1%
- Burn rate alerts: [2x and 10x expected]

**Status:** ✅ Defined

## Security Configuration

### Authentication & Authorization

**User Authentication:** [OAuth 2.0 / SAML / API Keys]
**Service Authentication:** [IAM Roles / Managed Identities / Service Principals]
**Authorization Model:** [RBAC / ABAC / Custom]

**Status:** ✅ Complete

### Secrets Management

**Secrets Platform:** [AWS Secrets Manager / Azure Key Vault / HashiCorp Vault]

**Secrets Configured:**
- [ ] Database credentials
- [ ] API keys for external services
- [ ] Encryption keys
- [ ] Service certificates

**Rotation Policy:** [90 days automatic rotation]
**Access Control:** [Least privilege via IAM]

**Status:** ✅ Complete

### Network Security

**Security Groups/NSGs:**
- Service SG: Allow 443 from ALB, 8080 from internal
- Database SG: Allow 5432 from service SG only
- Status: ✅ Complete

**WAF:** [Enabled / Not Applicable]
- Rules: [OWASP Top 10, rate limiting]
- Status: ✅ Complete / ⏳ N/A

**DDoS Protection:** [AWS Shield / Azure DDoS Protection]
**Status:** ✅ Complete

### Encryption

**At Rest:**
- Database: [AES-256 encryption enabled]
- Storage: [S3 SSE-KMS / Azure Storage encryption]
- Backups: [Encrypted with KMS/Key Vault]
- Status: ✅ Complete

**In Transit:**
- TLS version: [1.3 minimum, 1.2 supported]
- Certificate: [ACM / Azure Key Vault managed]
- HTTPS enforcement: [Yes]
- Status: ✅ Complete

### Security Scanning

**Pipeline Security:**
- [x] SAST (Static Application Security Testing)
- [x] Dependency scanning
- [x] Container image scanning
- [x] Secrets detection
- [x] Infrastructure as Code scanning

**Vulnerability Management:**
- Scanning frequency: [Every build + weekly]
- Critical vulnerabilities: [30-day remediation SLA]
- High vulnerabilities: [60-day remediation SLA]

**Status:** ✅ Complete

### Compliance & Audit

**Compliance Requirements:** [SOC 2 / HIPAA / PCI-DSS / GDPR]
**Audit Logging:** [CloudTrail / Azure Activity Log / Custom]
**Log Retention:** [1 year for compliance]
**Status:** ✅ Complete

## Operational Procedures

### Deployment Runbook

**Pre-Deployment:**
1. Review and approve PR
2. Ensure all tests pass
3. Get approval from Engineering Manager
4. Schedule deployment window (if needed)
5. Notify team in Slack

**Deployment:**
1. Tag release in Git: `v[version]`
2. Trigger production pipeline
3. Approve production deployment
4. Monitor deployment progress
5. Validate health checks pass
6. Monitor metrics for 30 minutes

**Post-Deployment:**
1. Verify service functionality
2. Check error rates and latency
3. Update status page if needed
4. Document deployment in changelog

**Rollback:**
```bash
# If issues detected
./scripts/rollback.sh service-name v[previous-version]
```

**Status:** ✅ Documented

### Incident Response Runbook

**On-Call:** [PagerDuty rotation]

**Incident Response Steps:**
1. Acknowledge alert within 5 minutes
2. Assess severity (P0-P3)
3. Create incident channel: `#incident-[date]`
4. Begin investigation (check dashboards, logs, recent deployments)
5. Implement mitigation (rollback, scale up, etc.)
6. Communicate with stakeholders every 30 minutes
7. Document timeline and actions
8. Resolve incident and update status page
9. Schedule post-mortem within 48 hours

**Common Issues:**
- High error rate: [Check recent deployments, rollback if needed]
- High latency: [Check database performance, scale up if needed]
- Service down: [Check health of dependencies, restart if needed]

**Status:** ✅ Documented

### Scaling Procedures

**Auto-Scaling:**
- Enabled: [Yes]
- Scale up: CPU > 70% for 3 minutes
- Scale down: CPU < 30% for 10 minutes
- Cooldown: [5 minutes]

**Manual Scaling:**
```bash
# Scale up
aws ecs update-service --service [service] --desired-count [N]

# Or for Kubernetes
kubectl scale deployment [service] --replicas=[N]
```

**Status:** ✅ Configured and Tested

### Backup & Recovery

**Backup Strategy:**
- Database: Automated daily backups, 7-day retention
- Configuration: Version controlled in Git
- Logs: 30-day retention, 1-year archive

**Recovery Procedure:**
```bash
# Restore database from backup
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier [restored-instance] \
  --db-snapshot-identifier [snapshot-id]
```

**RTO (Recovery Time Objective):** [4 hours]
**RPO (Recovery Point Objective):** [15 minutes]

**Status:** ✅ Tested

## Cost Estimate

**Monthly Cost by Environment:**

| Component | Dev | Staging | Production | Total |
|-----------|-----|---------|------------|-------|
| Compute | $[X] | $[Y] | $[Z] | $[Total] |
| Database | $[X] | $[Y] | $[Z] | $[Total] |
| Load Balancer | $[X] | $[Y] | $[Z] | $[Total] |
| Storage | $[X] | $[Y] | $[Z] | $[Total] |
| Monitoring | $[X] | $[Y] | $[Z] | $[Total] |
| Other | $[X] | $[Y] | $[Z] | $[Total] |
| **Total** | **$[Dev]** | **$[Stg]** | **$[Prod]** | **$[Grand Total]** |

**Cost Optimization:**
- Reserved instances for production: [20% savings]
- Auto-scaling during off-peak: [15% savings]
- S3 lifecycle policies: [10% savings]

## Production Readiness Checklist

### Infrastructure
- [x] Compute resources provisioned (dev, staging, prod)
- [x] Networking configured (VPC, subnets, security groups)
- [x] Load balancer configured with health checks
- [x] Auto-scaling configured and tested
- [x] DNS configured
- [x] IaC code reviewed and committed

### Database
- [x] Database provisioned and configured
- [x] Connection pooling configured
- [x] Backups configured and tested
- [x] Read replicas configured (if needed)
- [x] Migrations pipeline set up
- [x] Database monitoring configured

### CI/CD
- [x] Build pipeline configured
- [x] Test pipeline configured
- [x] Deployment pipeline configured (all environments)
- [x] Security scanning integrated
- [x] Approval gates configured
- [x] Rollback tested

### Monitoring
- [x] Metrics collection configured
- [x] Dashboards created
- [x] Alerts configured
- [x] Logging configured
- [x] Distributed tracing configured
- [x] SLIs/SLOs defined
- [x] On-call rotation configured

### Security
- [x] Secrets in secure vault
- [x] Encryption at rest and in transit
- [x] Security groups configured (least privilege)
- [x] WAF configured (if applicable)
- [x] Security scanning in CI/CD
- [x] Audit logging enabled
- [x] Threat model reviewed

### Operations
- [x] Deployment runbook created
- [x] Incident response runbook created
- [x] Scaling procedures documented
- [x] Backup and recovery tested
- [x] Load testing completed
- [x] Documentation updated

### Approvals
- [x] Infrastructure reviewed by DevOps Engineer
- [x] Security reviewed by Security Engineer
- [x] Monitoring reviewed by SRE
- [x] Database reviewed by Database Admin
- [x] Production deployment approved by Engineering Manager

## Go-Live

**Production Deployment Date:** [YYYY-MM-DD]
**Deployment Window:** [HH:MM - HH:MM UTC]
**Deployment Lead:** [Name]
**On-Call Engineer:** [Name]

**Post Go-Live Monitoring:**
- Monitor for 24 hours post-deployment
- Daily check-ins for first week
- Review metrics weekly for first month

**Status:** ✅ Live / ⏳ Pending / 🔴 Not Started

## Post-Onboarding Tasks

- [ ] Conduct load testing in production (week 1)
- [ ] Review and optimize costs (week 2)
- [ ] First incident drill (week 4)
- [ ] Documentation review and update (week 4)
- [ ] Onboarding retrospective with team (week 4)

## Team & Contacts

**Service Owner:** [Name / Team]
**Engineering Manager:** [Name]
**On-Call Rotation:** [PagerDuty link]

**Support Contacts:**
- DevOps: [Team Slack channel]
- SRE: [Team Slack channel]
- Security: [Team Slack channel]
- Database: [Team Slack channel]

---

**Onboarding Completed By:** [Names of all team members involved]
**Sign-Off Date:** [Date]
**Document Version:** 1.0
**Last Updated:** [Timestamp]
```

## Important Guidelines

- **Parallel execution**: Launch multiple agents simultaneously to work on independent tasks
- **Automate everything**: Manual processes should be exceptions, not the rule
- **Security from the start**: Don't add security as an afterthought
- **Production-ready from day one**: Every environment should meet production standards
- **Document as you go**: Don't wait until the end to document
- **Test thoroughly**: Test deployments, rollbacks, scaling, backups before go-live
- **Monitor everything**: If it's important, monitor it
- **Plan for failure**: Incidents will happen; be prepared with runbooks
- **Cost-conscious**: Understand and optimize costs from the beginning
- **Collaborate**: Onboarding requires the full enablement team working together

## Common Onboarding Pitfalls to Avoid

- ❌ Skipping security scanning in CI/CD
- ❌ No automated rollback capability
- ❌ Insufficient monitoring and alerting
- ❌ Missing runbooks for common operations
- ❌ Secrets hardcoded or in environment variables
- ❌ No load testing before production
- ❌ Manual deployment processes
- ❌ Missing backup and recovery testing
- ❌ Inadequate documentation

## Success Criteria

A successful service onboarding results in:
- ✅ Service deployed to all environments (dev, staging, prod)
- ✅ CI/CD pipeline fully automated from commit to production
- ✅ Comprehensive monitoring, logging, and alerting in place
- ✅ Security controls implemented and validated
- ✅ Runbooks created for deployment, incident response, and operations
- ✅ Load testing completed successfully
- ✅ Backup and recovery procedures tested
- ✅ Team trained on operations and on-call procedures
- ✅ Production deployment approved by all stakeholders
- ✅ Service meets all production readiness criteria

The goal is to onboard services that are secure, reliable, observable, and operationally excellent from day one. A well-onboarded service requires minimal firefighting and operates smoothly in production.
