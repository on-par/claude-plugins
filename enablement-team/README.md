# Enablement Team Plugin for Claude Code

Simulate a complete platform engineering team with specialized agents for infrastructure, reliability, security, and cloud operations. Perfect for platform teams building foundational services, or development teams needing infrastructure expertise.

## What is the Enablement Team Plugin?

This plugin brings together six specialized platform engineering agents and three operational commands to help you design, deploy, and maintain production infrastructure with expert guidance across DevOps, SRE, cloud platforms, security, and database operations.

Think of it as having a complete platform team at your fingertips—each with deep expertise in making systems reliable, secure, and scalable.

## Features

### Six Specialized Platform Engineering Agents

**Operations & Reliability:**
- **devops-engineer**: CI/CD pipelines, deployment automation, infrastructure as code, build systems
- **sre**: Production reliability, monitoring, alerting, incident response, observability

**Cloud Platform Specialists:**
- **aws-specialist**: AWS architecture, services, best practices, cost optimization
- **azure-specialist**: Azure architecture, services, best practices, cost optimization

**Data & Security:**
- **db-admin**: Database design, performance, backups, migrations, scaling
- **security-engineer**: Security architecture, compliance, threat modeling, secrets management

### Three Operational Commands

**Infrastructure Operations:**
- `/enablement-team:design-infrastructure` - Design complete infrastructure architecture for a service
- `/enablement-team:incident-response` - Coordinate incident response and post-mortem
- `/enablement-team:onboard-service` - Onboard a new service to production with full automation

## Installation

Install the enablement-team plugin in Claude Code:

```bash
/plugin install enablement-team
```

That's it! The plugin will be available immediately.

## Quick Start

### Design Infrastructure Architecture

Create a comprehensive infrastructure design before building:

```
/enablement-team:design-infrastructure "Real-time analytics API service"
```

The team will design:
- Complete cloud architecture (DevOps Engineer, Cloud Specialist)
- Database topology and scaling strategy (DB Admin)
- Monitoring and reliability approach (SRE)
- Security controls and compliance (Security Engineer)
- Cost estimates and optimization strategies (All)

Output: Complete architecture document with infrastructure as code structure, cost estimates, and implementation roadmap.

### Respond to Production Incident

Coordinate rapid incident response with systematic troubleshooting:

```
/enablement-team:incident-response "API returning 500 errors for 10% of requests"
```

The team will:
- Assess severity and impact (SRE - Incident Commander)
- Check monitoring and system health (SRE)
- Investigate infrastructure and deployments (DevOps Engineer)
- Analyze database performance (DB Admin)
- Check for security incidents (Security Engineer)
- Implement remediation and document post-mortem (All)

Output: Incident report with timeline, root cause analysis, remediation steps, and action items to prevent recurrence.

### Onboard Service to Production

Complete production onboarding with automation, monitoring, and security:

```
/enablement-team:onboard-service "User authentication service"
```

The team will:
- Provision infrastructure (DevOps Engineer, Cloud Specialist)
- Set up database and backups (DB Admin)
- Create CI/CD pipeline with security scanning (DevOps Engineer)
- Configure monitoring, alerting, and SLOs (SRE)
- Implement security controls (Security Engineer)
- Test deployment and rollback procedures (All)

Output: Production-ready service with full automation, comprehensive monitoring, documented runbooks, and go-live checklist.

## Command Reference

### `/enablement-team:design-infrastructure [service description]`

**Purpose:** Design comprehensive infrastructure architecture for a new service or system

**When to use:**
- Starting a new service or application
- Need cloud architecture guidance
- Planning infrastructure before development
- Want to understand costs and trade-offs
- Need security and compliance architecture

**Output:** Complete architecture document including component design, networking, database topology, CI/CD pipeline, monitoring strategy, security controls, cost estimates, and implementation roadmap

**Example:**
```
/enablement-team:design-infrastructure "E-commerce checkout service with PCI compliance requirements"
```

---

### `/enablement-team:incident-response [incident description]`

**Purpose:** Coordinate incident response to diagnose, remediate, and document production incidents

**When to use:**
- Service outage or degraded performance
- Database performance issues
- Security incident or suspicious activity
- Infrastructure problems
- Need post-mortem documentation

**Output:** Comprehensive incident report with timeline, root cause analysis, impact assessment, remediation steps, lessons learned, and action items

**Example:**
```
/enablement-team:incident-response "Database replication lag causing stale data"
```

---

### `/enablement-team:onboard-service [service name]`

**Purpose:** Onboard a new service to production with full infrastructure, automation, monitoring, and security

**When to use:**
- Deploying a new service to production
- Need complete infrastructure setup
- Want CI/CD pipeline automation
- Need monitoring and alerting configured
- Require security controls in place

**Output:** Production-ready service with infrastructure provisioned, CI/CD configured, monitoring active, security hardened, runbooks documented, and go-live checklist completed

**Example:**
```
/enablement-team:onboard-service "Payment processing API"
```

## Agent Details

### devops-engineer
**Model:** Sonnet | **Color:** Blue | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Expert in CI/CD pipelines, deployment automation, and infrastructure as code. Focuses on:
- Building and optimizing CI/CD pipelines
- Infrastructure as code (Terraform, CloudFormation)
- Deployment strategies (blue-green, canary, rolling)
- Build system optimization
- GitOps workflows

**When to use directly:** Need pipeline design, IaC implementation, deployment automation, build optimization

---

### sre
**Model:** Sonnet | **Color:** Red | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Site reliability expert focused on production systems. Focuses on:
- Defining SLIs, SLOs, and SLAs
- Monitoring and observability
- Incident management and post-mortems
- On-call procedures and runbooks
- Capacity planning

**When to use directly:** Need reliability guidance, monitoring strategy, incident response, SLO definition

---

### aws-specialist
**Model:** Sonnet | **Color:** Orange | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

AWS cloud architecture expert. Focuses on:
- AWS service selection and architecture
- VPC networking and security groups
- ECS, EKS, Lambda, RDS, and other AWS services
- Cost optimization and reserved instances
- AWS best practices

**When to use directly:** Need AWS architecture, service recommendations, cost optimization, AWS-specific guidance

---

### azure-specialist
**Model:** Sonnet | **Color:** Cyan | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Azure cloud architecture expert. Focuses on:
- Azure service selection and architecture
- VNet networking and NSGs
- AKS, App Service, Functions, SQL Database, and other Azure services
- Cost optimization and reserved instances
- Azure best practices

**When to use directly:** Need Azure architecture, service recommendations, cost optimization, Azure-specific guidance

---

### db-admin
**Model:** Sonnet | **Color:** Purple | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Database administration expert. Focuses on:
- Database design and schema optimization
- Performance tuning and query optimization
- Backup and disaster recovery
- Replication and high availability
- Database migrations

**When to use directly:** Need database design, performance tuning, backup strategy, migration planning

---

### security-engineer
**Model:** Sonnet | **Color:** Yellow | **Tools:** Glob, Grep, Read, Write, Edit, TodoWrite, Bash

Security and compliance expert. Focuses on:
- Threat modeling and security architecture
- Authentication and authorization
- Secrets management
- Security scanning and vulnerability management
- Compliance (SOC 2, HIPAA, PCI-DSS, GDPR)

**When to use directly:** Need security architecture, threat modeling, compliance guidance, secrets management

## Use Cases

### Platform Team Workflow

As a platform team, use the plugin to:

1. **Design new infrastructure:**
   ```
   /enablement-team:design-infrastructure "Multi-tenant SaaS platform"
   ```
   Get complete architecture with cloud services, networking, security, and cost estimates.

2. **Onboard team services:**
   ```
   /enablement-team:onboard-service "Analytics service"
   ```
   Provide teams with production-ready infrastructure, automation, and monitoring.

3. **Respond to incidents:**
   ```
   /enablement-team:incident-response "Database connection pool exhaustion"
   ```
   Coordinate response, document timeline, and create preventative action items.

4. **Review architecture:**
   Use individual agents to review existing infrastructure and provide recommendations for improvements.

### Development Team Workflow

Use the plugin when you need platform expertise:

1. **Get infrastructure guidance:**
   ```
   /enablement-team:design-infrastructure "Microservice for order processing"
   ```
   Understand what infrastructure you need before building.

2. **Set up monitoring:**
   Use the SRE agent to design monitoring, alerting, and SLOs for your service.

3. **Debug production issues:**
   ```
   /enablement-team:incident-response "High memory usage causing OOM crashes"
   ```
   Get systematic troubleshooting across infrastructure, database, and application layers.

4. **Prepare for production:**
   ```
   /enablement-team:onboard-service "User notification service"
   ```
   Ensure your service meets production standards.

## Best Practices

### For Platform Teams

- **Design before building:** Use design-infrastructure before provisioning resources
- **Automate everything:** Manual operations don't scale across teams
- **Document as you build:** Create runbooks during onboarding, not after incidents
- **Incident reviews:** Always conduct blameless post-mortems with action items
- **Cost monitoring:** Track infrastructure costs and optimize regularly

### For Development Teams

- **Engage early:** Involve platform team in architecture discussions
- **Follow patterns:** Use established infrastructure patterns and templates
- **Monitor proactively:** Don't wait for incidents to set up monitoring
- **Test disaster recovery:** Regularly test backups and rollback procedures
- **Document dependencies:** Keep runbooks updated with service dependencies

### General Tips

1. **Security by default:** Build security in from the start, not as an afterthought
2. **Infrastructure as code:** All infrastructure should be versioned and automated
3. **Observability first:** You can't fix what you can't see—monitor everything
4. **Cost awareness:** Understand infrastructure costs and optimize continuously
5. **Blameless culture:** Focus on systems and processes, not individuals
6. **Parallel execution:** Run multiple agents simultaneously for efficiency
7. **Production-ready mindset:** Every environment should meet production standards

## Advanced Usage

### Calling Agents Directly

You can invoke individual agents using the Task tool:

```
Use the sre agent to review our monitoring strategy and recommend improvements
```

```
Use the security-engineer agent to conduct a threat model review of our authentication system
```

This gives you access to specific expertise without running a full command.

### Integration with Development Workflow

Combine with other plugins for complete workflows:

1. Research (RPI plugin): `/rpi:research "Kubernetes networking options"`
2. Design (Enablement): `/enablement-team:design-infrastructure "Kubernetes-based microservices platform"`
3. Plan (RPI plugin): `/rpi:plan ./rpi/k8s/research.md`
4. Implement (RPI plugin): `/rpi:implement-task ./rpi/k8s/plan.md`
5. Onboard (Enablement): `/enablement-team:onboard-service "First microservice"`

### Multi-Cloud Strategy

Use both cloud specialist agents for multi-cloud decisions:

```
Use the aws-specialist and azure-specialist agents to compare options for our data warehouse. We need cost estimates for both platforms.
```

## Philosophy

The Enablement Team plugin is built on these principles:

**Reliability First:** Systems should be designed for reliability from the start
**Security by Default:** Security is not optional; it's foundational
**Automation Over Manual:** Manual processes don't scale; automate everything
**Observability:** You can't improve what you can't measure
**Blameless Culture:** Focus on systems, not individuals
**Cost Consciousness:** Understand and optimize infrastructure costs
**Production Standards:** Every environment should meet production standards
**Documentation:** Good documentation reduces incidents and onboarding time

Platform engineering is about enabling development teams to ship faster and more reliably by providing excellent infrastructure, tooling, and operational excellence.

## FAQ

**Q: Do I need a platform team to use this plugin?**
A: No! Development teams benefit from platform expertise. It helps you understand infrastructure, security, and operational concerns when building services.

**Q: Which cloud platform should I choose?**
A: Both AWS and Azure specialists are available. Choose based on your organization's existing infrastructure, team expertise, and specific service requirements.

**Q: How do I know when to use each command?**
A: Use design-infrastructure when planning new systems, incident-response during outages, and onboard-service when deploying to production.

**Q: Can this replace our platform team?**
A: No. Use it to augment human expertise, prepare for discussions, document decisions, or when platform teams are unavailable.

**Q: What if we use GCP instead of AWS or Azure?**
A: The agents understand multi-cloud patterns. While optimized for AWS and Azure, principles apply across cloud providers.

**Q: How detailed are the infrastructure designs?**
A: Very detailed. You get specific service selections, networking configurations, security controls, cost estimates, and IaC structure.

## Use Case Examples

### Startup Launching First Production Service

```
/enablement-team:design-infrastructure "MVP SaaS application with Stripe integration"
```

Get a complete, production-ready architecture with cost estimates (critical for startups), security best practices, and scalability considerations.

### Enterprise Modernizing Legacy Application

```
/enablement-team:design-infrastructure "Migrating monolithic Java app to microservices on Kubernetes"
```

Receive migration strategy, cloud-native architecture, security controls for compliance, and phased implementation roadmap.

### Platform Team Standardizing Service Onboarding

```
/enablement-team:onboard-service "Template service for standardization"
```

Create a reference implementation with CI/CD, monitoring, security scanning, and documentation that teams can replicate.

### On-Call Engineer Responding to P0 Incident

```
/enablement-team:incident-response "Complete service outage - all requests returning 503"
```

Get systematic troubleshooting across all infrastructure layers, coordinate response, and produce post-mortem documentation.

## Contributing

Contributions are welcome! Ideas for enhancement:

- Additional agent roles (Network Engineer, Data Engineer, ML Engineer)
- New command workflows (Security Audit, Cost Optimization, Disaster Recovery Drill)
- Cloud provider integrations (GCP, Oracle Cloud)
- Compliance frameworks (HIPAA, PCI-DSS automation)
- Chaos engineering experiments

Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Support

- **Issues:** Report bugs or request features via [GitHub Issues](https://github.com/on-par/claude-plugins/issues)
- **Discussions:** Ask questions or share ideas in [GitHub Discussions](https://github.com/on-par/claude-plugins/discussions)

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Author

**Patrick Robinson**
- Website: [patrickarobinson.com](https://patrickarobinson.com)
- GitHub: [@on-par](https://github.com/on-par)
- Email: patrick@onpardev.com

## Acknowledgments

Built with inspiration from platform engineering teams running production systems at scale. Special thanks to the DevOps, SRE, and cloud engineering communities for proven practices that informed this plugin.

---

**Version:** 0.1.0
**Status:** Active Development
**Last Updated:** 2025-01-19
