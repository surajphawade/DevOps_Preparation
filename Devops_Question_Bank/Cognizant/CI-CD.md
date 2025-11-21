# CI/CD – Azure DevOps – Cognizant (CTS)

## Q1. CI/CD architecture.
### Answer
Source → Build → Test → Scan → Deploy → Validation → Monitoring.  
Uses Azure Repos, Pipelines, Artifacts, Key Vault.
### Follow-Up Points
- Multi-stage YAML  
- Environments + approvals  
### Example
Build → Terraform apply → Helm deploy to AKS.

---

## Q2. Steps to create pipeline.
### Answer
Create repo → setup YAML → define stages/jobs → add service connections → add variable groups → configure triggers.
### Follow-Up Points
- Use Key Vault for secrets  
- Use templates for reuse  
### Example
Starter pipeline → Add Docker + deploy jobs.

---

## Q3. How did you set up pipeline in Azure DevOps?
### Answer
Configured YAML pipeline with tasks for code build, containerization, infrastructure deployment, and Kubernetes rollout.
### Follow-Up Points
- Use separate stages per environment  
- Use branch policies  
### Example
stages: build → test → deploy → prod.

---

## Q4. Deployment strategies you follow?
### Answer
Blue-Green, Canary, Rolling, Recreate.
### Follow-Up Points
- Canary reduces production risk  
### Example
Rolling update for AKS deployments.

---

## Q5. How do you set up alerting for pipeline?
### Answer
Use ADO notifications, Azure Monitor alerts, webhook integrations, and email triggers.
### Follow-Up Points
- Pipeline failure → Slack/Teams alert  
### Example
Project Settings → Notifications → Build Failure.

---

## Q6. How do you troubleshoot pipeline failure?
### Answer
Check logs, agent status, permissions, variables, service connections, YAML conditions.
### Follow-Up Points
- Enable system.debug  
- Validate artifact availability  
### Example
Fix missing subscription permission in service connection.

