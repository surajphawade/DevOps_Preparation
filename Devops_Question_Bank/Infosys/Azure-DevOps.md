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

