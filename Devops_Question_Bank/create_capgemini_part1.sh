#!/bin/bash
set -e

BASE="Infosys"
mkdir -p "$BASE"

echo "Creating Infosys interview markdown files..."

###############################################
# 1. General
###############################################
cat > "$BASE/General.md" << 'EOF'
# General / Introduction – Infosys Interview Questions

## Q1. Tell me about yourself?
### Answer
Give a short introduction covering your experience, cloud technologies, DevOps tools, and strengths.
### Follow-Up Points
- Keep it within 45–60 seconds  
- Highlight Azure, Terraform, CI/CD, Kubernetes  
- Mention certifications  
### Example
“I work with Azure, Terraform, ADO, AKS, Docker, and automation. I design CI/CD pipelines and provision infra using IaC.”

---

## Q2. Tell me about your daily routine?
### Answer
Explain your daily DevOps responsibilities such as CI/CD monitoring, infra updates, deployments, meetings, and troubleshooting.
### Follow-Up Points
- Show ownership  
- Mention ticketing + standups  
- Mention automation improvements  
### Example
“Monitor pipelines, provision infra, fix issues, review PRs, and automate manual tasks.”

EOF

###############################################
# 2. Azure DevOps
###############################################
cat > "$BASE/Azure-DevOps.md" << 'EOF'
# Azure DevOps (ADO) – Infosys Interview Questions

## Q1. Tell Azure DevOps features?
### Answer
Azure DevOps provides Repos, Pipelines, Boards, Artifacts, Test Plans, and deployment automation.
### Follow-Up Points
- Supports YAML pipelines  
- Integrates with GitHub & Azure services  
### Example
ADO used for CI/CD + Azure deployments via service connections.

---

## Q2. What is the difference between Azure Repos and Boards?
### Answer
Repos store Git code; Boards manage work items, sprints, tasks, and bugs.
### Follow-Up Points
- Boards = Agile project management  
- Repos = version control  
### Example
Boards → User Stories; Repos → Code for microservices.

---

## Q3. How do you push code to Azure Repos?
### Answer
Clone repo → make changes → commit → push.
### Follow-Up Points
- Use PAT for access if required  
- Enforce PR policies  
### Example
git clone <repo-url>  
git add .  
git commit -m "update"  
git push origin main

---

## Q4. What applications/plugins can you use in Azure DevOps?
### Answer
Terraform, SonarQube, Docker, Kubernetes, Azure CLI, Key Vault tasks, and marketplace extensions.
### Follow-Up Points
- Use installable extensions  
- Use custom tasks or scripts  
### Example
Terraform task for infra deployment.

---

## Q5. If a new engineer joins your team, how will you give permission in Azure DevOps?
### Answer
Add user through Project Settings → Permissions → assign role (Contributor/Reader).
### Follow-Up Points
- Use least-privilege  
- Control repo/pipeline access  
### Example
Give read access to prod pipeline; write to dev.

---

## Q6. What level of permission will you give?
### Answer
Contributor for day-to-day work, Reader for viewing-only, and limited access to sensitive pipelines.
### Follow-Up Points
- Ensure repo protections  
- Avoid giving admin roles  
### Example
Contributor: push code + run pipelines.

---

## Q7. If a user cannot connect to a production server VM, what steps will you take?
### Answer
Check NSG rules, VM status, credentials, firewall, network path, and RBAC permissions.
### Follow-Up Points
- Check monitoring logs  
- Validate Bastion/VPN  
### Example
az network watcher test-connectivity --source user --dest vm

---

## Q8. What is the flow of CI/CD pipeline with Kubernetes cluster?
### Answer
Code → Build → Push Docker image → Deploy to AKS using manifests/Helm → Validation tests.
### Follow-Up Points
- Use ACR  
- Use service connections  
### Example
kubectl apply -f deployment.yaml from pipeline.

EOF

###############################################
# 3. CI/CD
###############################################
cat > "$BASE/CI-CD.md" << 'EOF'
# CI/CD Pipeline – Infosys Interview Questions

## Q1. How do you handle secrets in CI/CD?
### Answer
Use secret variables, Key Vault integration, managed identities, and avoid secrets in repo.
### Follow-Up Points
- Mask secrets  
- Rotate credentials  
### Example
AzureKeyVault@2 to fetch secrets at runtime.

---

## Q2. How do you provision infrastructure? (CI/CD)
### Answer
Use Terraform tasks in Azure DevOps pipeline with remote backend and service connection authentication.
### Follow-Up Points
- Use Terraform plan → approval → apply  
- Separate dev/stage/prod tfvars  
### Example
Terraform CLI task: init → plan → apply.

---

## Q3. Tell me about your CI/CD deployment process.
### Answer
Code commit → PR → Build → Test → Scan → Deploy → Approvals → Release to prod.
### Follow-Up Points
- Use multi-stage pipelines  
- Add quality gates  
### Example
Build stage → Deploy to AKS stage → Validation.

EOF

###############################################
# 4. Terraform
###############################################
cat > "$BASE/Terraform.md" << 'EOF'
# Terraform – Infosys Interview Questions

## Q1. How do you provision infrastructure?
### Answer
Write Terraform configuration → init → plan → apply using CI/CD pipeline with remote backend.
### Follow-Up Points
- Use modules  
- Separate state per environment  
### Example
terraform apply -var-file="prod.tfvars"

---

## Q2. Tell me key features of Terraform?
### Answer
Declarative, idempotent, multi-cloud, uses state, modular, and supports dependency graph.
### Follow-Up Points
- Plan → predicts changes  
- Provider ecosystem  
### Example
Provision AKS, ACR, VNet in one config.

---

## Q3. Tell me difference between init, plan, apply?
### Answer
init → setup provider/plugins  
plan → preview changes  
apply → execute changes  
### Follow-Up Points
- Apply is irreversible  
- Plan is safe and read-only  
### Example
terraform init → terraform plan → terraform apply

---

## Q4. Why do we use Terraform? Benefits?
### Answer
Automates infra creation, ensures consistency, supports versioning, avoids manual errors, and is reusable through modules.
### Follow-Up Points
- Infra as code  
- Environment standardization  
### Example
Same module → dev, stage, prod.

EOF

###############################################
# 5. Azure Cloud Services
###############################################
cat > "$BASE/Azure-Cloud.md" << 'EOF'
# Azure Cloud Services – Infosys Interview Questions

## Q1. Have you worked with Azure Web App Services?
### Answer
Yes, App Services are PaaS offerings for hosting web apps and APIs.
### Follow-Up Points
- Deployment slots  
- Auto-scaling  
### Example
Deploy using “az webapp deploy”.

---

## Q2. Do you also work with PaaS services?
### Answer
Yes — App Services, SQL PaaS, Key Vault, Storage, Event Hub, Functions.
### Follow-Up Points
- Highlight managed services  
### Example
SQL PaaS → no OS maintenance.

---

## Q3. How do you provision SQL database?
### Answer
Use Azure SQL Database via portal, CLI, Terraform, or DevOps pipelines.
### Follow-Up Points
- Configure firewall rules  
- Use private endpoints  
### Example
az sql db create --name mydb

---

## Q4. Why SQL PaaS instead of SQL on VM?
### Answer
SQL PaaS handles patches, backups, HA, DR, and scaling automatically.
### Follow-Up Points
- No OS-level management  
- More secure  
### Example
Automated point-in-time restore.

---

## Q5. If database is deleted, how can we recover it?
### Answer
Azure SQL PaaS supports point-in-time restore and backup retention.
### Follow-Up Points
- Up to 35 days retention  
### Example
Restore from deleted server blade.

---

## Q6. How to connect SQL database with application?
### Answer
Use connection strings stored in Key Vault or App Settings.
### Follow-Up Points
- Use Managed Identity where possible  
### Example
SQL connection string → WebApp settings.

---

## Q7. What Azure services have you worked on?
### Answer
VMs, VNets, NSGs, App Services, SQL, Storage, Key Vault, ACR, AKS, Monitor.
### Follow-Up Points
- Mention real infra  
### Example
AKS + ACR + private endpoints.

EOF

###############################################
# 6. Kubernetes
###############################################
cat > "$BASE/Kubernetes.md" << 'EOF'
# Kubernetes – Infosys Interview Questions

## Q1. Do you know about replica sets?
### Answer
ReplicaSets ensure a fixed number of pod replicas are always running.
### Follow-Up Points
- Deployment uses ReplicaSets  
- Self-healing  
### Example
kubectl get rs

---

## Q2. What is the flow of CI/CD with Kubernetes?
### Answer
Build → push Docker image → update manifest/Helm → deploy to AKS → health checks.
### Follow-Up Points
- Use service connections  
### Example
kubectl set image deployment/app app=repo/app:v2

---

## Q3. How do you deploy containers using ADO?
### Answer
Build Docker image → Push to ACR → Kubernetes manifest task to deploy.
### Follow-Up Points
- Use kubeconfig or service connection  
### Example
kubectl apply -f deployment.yaml

---

## Q4. How to enable monitoring in Kubernetes?
### Answer
Enable Container Insights or install Prometheus/Grafana.
### Follow-Up Points
- Monitor pods, nodes, containers  
### Example
az aks enable-addons --addons monitoring

EOF

###############################################
# 7. Monitoring
###############################################
cat > "$BASE/Monitoring.md" << 'EOF'
# Monitoring – Infosys Interview Questions

## Q1. Tell me about Log Analytics or Application Insights?
### Answer
Log Analytics collects logs/metrics in a workspace; App Insights monitors applications with dependencies and performance insights.
### Follow-Up Points
- KQL queries  
- Dashboards + alerts  
### Example
Heartbeat | summarize count() by Computer

EOF

###############################################
# 8. Troubleshooting
###############################################
cat > "$BASE/Troubleshooting.md" << 'EOF'
# Troubleshooting – Infosys Interview Questions

## Q1. A user not able to connect to production VM — what steps to take?
### Answer
Check VM power state, NSG rules, firewall, Bastion/VPN access, credentials, and diagnostics logs.
### Follow-Up Points
- Check network route  
- Validate RBAC  
### Example
az network watcher test-connectivity

EOF

###############################################
# 9. Security
###############################################
cat > "$BASE/Security.md" << 'EOF'
# Security / Secrets – Infosys Interview Questions

## Q1. How do you handle secrets in CI/CD?
### Answer
Use Key Vault, secret variables, masked logs, and service connections. Never store secrets in repo.
### Follow-Up Points
- Use RBAC  
- Rotate regularly  
### Example
AzureKeyVault@2 → fetch at runtime.

EOF

echo "Infosys – All markdown files created successfully!"
