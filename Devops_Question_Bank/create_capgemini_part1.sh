#!/bin/bash
set -e

BASE="CGI"
mkdir -p "$BASE"

echo "Creating CGI interview markdown files..."

###############################################
# 1. General / Introduction
###############################################
cat > "$BASE/General.md" << 'EOF'
# General / Introduction – CGI

## Q1. Tell me about yourself.
### Answer
Short professional introduction including your cloud skills, DevOps stack, and responsibilities.
### Follow-Up Points
- Keep under 1 minute  
- Highlight Azure, Terraform, CI/CD, AKS  
### Example
“I work with Azure, Terraform, Kubernetes, and CI/CD automation.”

---

## Q2. Tell me about your experience.
### Answer
Explain years of experience, tools, environments, main responsibilities, and achievements.
### Follow-Up Points
- Mention certifications  
- Highlight project scale  
### Example
“2+ years in cloud automation using Azure DevOps and Terraform.”

EOF

###############################################
# 2. Git / Version Control
###############################################
cat > "$BASE/Git.md" << 'EOF'
# Git / Version Control – CGI

## Q1. What is Git?
### Answer
Git is a distributed version control system used to track and manage source code changes.
### Follow-Up Points
- Allows branching & merging  
### Example
git init

---

## Q2. What is GitHub?
### Answer
GitHub is a cloud-based hosting platform for Git repositories.
### Follow-Up Points
- Supports PR, issue tracking  
### Example
Push repo → GitHub Actions.

---

## Q3. Difference between Git and GitHub?
### Answer
Git = version control tool  
GitHub = hosting service for Git repositories.
### Follow-Up Points
- Git works offline  
- GitHub adds collaboration  
### Example
Git commit locally → push to GitHub.

---

## Q4. What is version control?
### Answer
A system that tracks changes in code and manages versions.
### Follow-Up Points
- Helps rollback  
- Enables collaboration  
### Example
Git branching workflow.

---

## Q5. Difference between Git fetch and Git pull.
### Answer
Fetch downloads changes; pull downloads and merges them automatically.
### Follow-Up Points
- Pull can create conflicts  
### Example
git fetch origin

---

## Q6. What is merge conflict?
### Answer
Conflict when two commits modify the same lines of a file.
### Follow-Up Points
- Must resolve manually  
### Example
git merge feature-branch.

EOF

###############################################
# 3. CI/CD – Basic to Intermediate
###############################################
cat > "$BASE/CI-CD.md" << 'EOF'
# CI/CD – CGI

## Q1. What is CI/CD?
### Answer
CI = continuously integrate code.  
CD = continuously deliver or deploy applications.
### Follow-Up Points
- Automates build/test/deploy  
### Example
Build → Test → Deploy.

---

## Q2. How do you usually perform CI/CD?
### Answer
Using Azure DevOps, GitHub Actions, or Jenkins to automate code builds and deployments.
### Follow-Up Points
- Multi-stage YAML  
### Example
Build → Push image → Deploy to AKS.

---

## Q3. What tools do you use for CI/CD?
### Answer
Azure DevOps, GitHub Actions, Jenkins.
### Follow-Up Points
- Choose based on environment  
### Example
ADO pipeline with YAML.

---

## Q4. Have you used Jenkins?
### Answer
Yes — configured jobs, pipelines, and used plugins for automation.
### Follow-Up Points
- Declarative pipeline  
### Example
Jenkinsfile with stages.

EOF

###############################################
# 4. Cloud Fundamentals
###############################################
cat > "$BASE/Cloud.md" << 'EOF'
# Cloud Fundamentals – CGI

## Q1. What clouds have you worked with?
### Answer
Azure as primary platform; working knowledge of AWS basics.
### Follow-Up Points
- Mention services used  
### Example
VM, VNet, AKS, Key Vault.

---

## Q2. What is cloud computing?
### Answer
Delivery of computing services over the internet.
### Follow-Up Points
- Pay-as-you-go  
- Scalable & flexible  
### Example
Serverless app on Azure Functions.

---

## Q3. What cloud services have you used?
### Answer
VMs, VNets, NSGs, Storage, Key Vault, App Services, ACR, AKS, Monitor.
### Follow-Up Points
- Connect to real project use-case  
### Example
AKS + ACR deployment.

---

## Q4. PaaS vs IaaS?
### Answer
IaaS = virtual machines, networking  
PaaS = managed runtime for applications.
### Follow-Up Points
- PaaS reduces admin overhead  
### Example
App Service vs VM.

EOF

###############################################
# 5. Docker / Containerization
###############################################
cat > "$BASE/Docker.md" << 'EOF'
# Docker / Containers – CGI

## Q1. What is Docker?
### Answer
A container platform to package applications with dependencies.
### Follow-Up Points
- Lightweight & portable  
### Example
docker run nginx

---

## Q2. What is Dockerfile?
### Answer
A file containing build instructions for Docker images.
### Follow-Up Points
- Supports multi-stage builds  
### Example
FROM node:18 → COPY → RUN.

---

## Q3. Difference between Docker & VM?
### Answer
VM = hypervisor virtualizes hardware  
Docker = containers virtualize OS.
### Follow-Up Points
- Containers are lightweight  
### Example
VM boots in minutes; container in seconds.

EOF

###############################################
# 6. Security / Secrets
###############################################
cat > "$BASE/Security.md" << 'EOF'
# Security / Secrets – CGI

## Q1. How do you secure application secrets?
### Answer
Use Key Vault, secret variables, RBAC, encryption, and avoid storing secrets in code.
### Follow-Up Points
- Use private endpoints  
### Example
ADO → Key Vault reference.

---

## Q2. Where do you store secrets?
### Answer
Azure Key Vault or CI/CD secret variables.
### Follow-Up Points
- Rotate keys regularly  
### Example
KV secret reference in pipeline.

EOF

###############################################
# 7. Kubernetes / YAML
###############################################
cat > "$BASE/Kubernetes.md" << 'EOF'
# Kubernetes / YAML – CGI

## Q1. What is YAML?
### Answer
Human-readable configuration language used for Kubernetes manifests.
### Follow-Up Points
- Indentation-based  
### Example
apiVersion: v1

---

## Q2. Syntax of YAML?
### Answer
Key-value pairs with indentation; spaces instead of tabs.
### Follow-Up Points
- Supports lists & maps  
### Example
replicas: 3

---

## Q3. How do you write YAML?
### Answer
Define apiVersion, kind, metadata, and spec.
### Follow-Up Points
- Use proper indentation  
### Example
kind: Deployment

---

## Q4. What is Deployment in Kubernetes?
### Answer
A controller that manages replicas of pods.
### Follow-Up Points
- Supports rolling updates  
### Example
kubectl apply -f deployment.yaml

---

## Q5. Deployment vs StatefulSet?
### Answer
Deployment = stateless  
StatefulSet = stateful with persistent identity.
### Follow-Up Points
- Ordered deployment  
### Example
DB → StatefulSet.

---

## Q6. What is a pod?
### Answer
Smallest deployable unit in Kubernetes.
### Follow-Up Points
- Contains containers  
### Example
kubectl get pods.

---

## Q7. ClusterIP, NodePort, LoadBalancer?
### Answer
ClusterIP = internal  
NodePort = expose on node  
LoadBalancer = external service.
### Follow-Up Points
- Default = ClusterIP  

---

## Q8. Ingress vs LoadBalancer?
### Answer
LoadBalancer exposes service externally.  
Ingress provides routing based on host/path.
### Follow-Up Points
- Ingress is L7  
### Example
/api → pod A.

---

## Q9. How do you check logs in Kubernetes?
### Answer
Use kubectl logs <pod>.
### Follow-Up Points
- Use describe for events  
### Example
kubectl logs api-pod.

---

## Q10. How do you monitor cluster?
### Answer
Use Azure Monitor, Container Insights, or Prometheus/Grafana.
### Follow-Up Points
- Track nodes & pods  
### Example
Enable Insights in AKS.

EOF

###############################################
# 8. DevOps Concepts
###############################################
cat > "$BASE/DevOps.md" << 'EOF'
# DevOps Concepts – CGI

## Q1. What is DevOps?
### Answer
A culture and practice combining development & operations for rapid, reliable delivery.
### Follow-Up Points
- Automation focus  
### Example
CI/CD pipeline automation.

---

## Q2. What DevOps tools do you know?
### Answer
Azure DevOps, GitHub, Jenkins, Terraform, Docker, Kubernetes, Grafana, Prometheus.
### Follow-Up Points
- Map tools to purpose  
### Example
Terraform → IaC.

---

## Q3. What is automation in DevOps?
### Answer
Automating repetitive tasks like deployment, testing, provisioning, and monitoring.
### Follow-Up Points
- Reduces errors  
### Example
Automated YAML pipeline.

---

## Q4. What is configuration management?
### Answer
Managing system configuration consistently using tools like Ansible, Chef, Puppet.
### Follow-Up Points
- Ensures consistency  
### Example
Ansible playbooks.

EOF

###############################################
# 9. Terraform
###############################################
cat > "$BASE/Terraform.md" << 'EOF'
# Terraform – CGI

## Q1. What is Terraform?
### Answer
An Infrastructure-as-Code tool that automates provisioning.
### Follow-Up Points
- Declarative model  
### Example
resource "azurerm_resource_group".

---

## Q2. Why do we use Terraform?
### Answer
To manage infra consistently, repeatedly, and version-controlled.
### Follow-Up Points
- Works across clouds  
### Example
Terraform modules.

---

## Q3. What are providers?
### Answer
Plugins that allow Terraform to interact with cloud APIs.
### Follow-Up Points
- Must run init  
### Example
provider "azurerm".

EOF

###############################################
# 10. Monitoring / Logs
###############################################
cat > "$BASE/Monitoring.md" << 'EOF'
# Monitoring / Logs – CGI

## Q1. How do you check logs in Kubernetes?
### Answer
Use kubectl logs <pod>.
### Follow-Up Points
- Use describe for events  
### Example
kubectl logs app-pod.

---

## Q2. How do you monitor cluster?
### Answer
Use Container Insights, Log Analytics, Prometheus, Grafana.
### Follow-Up Points
- Monitor nodes, pod health  
### Example
Enable Insights in AKS.

EOF

echo "CGI – All markdown files created successfully!"
