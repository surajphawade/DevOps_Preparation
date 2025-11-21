# General DevOps & Architecture – Persistent Systems Interview Questions

## Q1. Explain your self introduction & career journey.
### Answer
Provide a concise background: your role, experience, key technologies, major projects, and what you specialize in (DevOps, IaC, CI/CD, Cloud).
### Follow-Up Points
- 40–60 seconds only  
- Mention DevOps tools & cloud stack  
- Highlight achievements (automation, cost reduction)  
- End with what you’re looking for next
### Example
"I’m a DevOps Engineer with 3 years of experience in Azure, Terraform, ADO, and AKS. I automate cloud infrastructure, build CI/CD, and ensure reliability for data and application pipelines."

---

## Q2. Explain your recent project.
### Answer
Describe problem statement, your responsibilities, tools/technologies used, and what improvements you delivered.
### Follow-Up Points
- Explain architecture (AKS, ACR, Terraform, CI/CD)  
- Explain deployment workflow  
- Mention major achievements
### Example
Terraform → AKS → ACR → GitHub Actions/ADO → Monitoring via Azure Monitor.

---

## Q3. What is your approach to deploying highly available infrastructure?
### Answer
Use multi-zone deployment, load balancers, redundancy, autoscaling, and infrastructure as code for consistency.
### Follow-Up Points
- Use multiple AZs  
- Use health probes and auto-healing  
- Zero-downtime deployment  
- Use backup & disaster recovery
### Example
AKS with multi-zone nodepools + Application Gateway + autoscaler.

---

## Q4. What components are you using for high availability and security in Terraform?
### Answer
Use lifecycle rules, availability zones, managed identities, private endpoints, and RBAC-based configurations.
### Follow-Up Points
- create_before_destroy  
- ignore_changes  
- Modules for repeatability  
- Network rules, NSGs, private DNS zones
### Example
Lifecycle block with prevent_destroy=true for critical resources.

---

## Q5. How do you manage infra for dev, stage, prod?
### Answer
Use separate state files, separate tfvars, isolated resource groups, and controlled deployments via CI/CD pipelines.
### Follow-Up Points
- Least privilege per environment  
- Approval gates for prod  
- Use naming standards and tagging
### Example
dev.tfvars → stage.tfvars → prod.tfvars managed via ADO multi-stage pipeline.

