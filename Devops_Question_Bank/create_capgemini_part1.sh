#!/bin/bash
set -e

BASE="United-Layer"
mkdir -p "$BASE"

echo "Creating ALL United Layer interview markdown files..."

###############################################
# 1. General.md
###############################################
cat > "$BASE/General.md" << 'EOF'
# General / Introduction – United Layer / Unity Cloud

## Q1. Tell me about yourself.
### Answer
Introduce your cloud & DevOps background, strong skills, responsibilities, and certifications.
### Follow-Up Points
- Keep answer under 60 seconds  
- Highlight Azure + Terraform + AKS + CI/CD  
### Example
“I build and automate cloud infra using Terraform, AKS, Azure DevOps, and monitoring tools.”

---

## Q2. Tell me about your experience.
### Answer
Summarize your hands-on experience, tools, platforms, and major project responsibilities.
### Follow-Up Points
- Mention scripting + automation  
### Example
“3 years in Azure Cloud, Terraform modules, AKS, CI/CD pipelines.”

---

## Q3. Tell me about your project.
### Answer
Describe architecture, microservices, deployments, storage, database, monitoring, CI/CD.
### Follow-Up Points
- Show clarity in flow  
### Example
Users → App Gateway → AKS → Microservices → Key Vault → SQL → Logs.

EOF

###############################################
# 2. Kubernetes.md
###############################################
cat > "$BASE/Kubernetes.md" << 'EOF'
# Kubernetes – United Layer / Unity Cloud

## Q1. What is Kubernetes architecture?
### Answer
Master-plane + worker nodes. Components include API server, etcd, scheduler, controller manager, kubelet, kube-proxy.
### Follow-Up Points
- Control plane handles orchestration  
- Nodes run workloads  
### Example
API Server → etcd → Nodes → Pods.

---

## Q2. What are different Kubernetes components?
### Answer
API server, etcd, scheduler, controller manager, kubelet, kube-proxy, CSI, CRI.
### Follow-Up Points
- Control-plane vs node components  
### Example
Worker node = kubelet + kube-proxy.

---

## Q3. What are Deployments?
### Answer
Used for stateless apps. Manages ReplicaSets and rollouts.
### Follow-Up Points
- Supports rolling updates  
### Example
replicas: 3

---

## Q4. What are StatefulSets?
### Answer
Manages stateful workloads requiring stable network identity and storage.
### Follow-Up Points
- Ordered deployment  
### Example
Databases, Zookeeper.

---

## Q5. What is ReplicaSet?
### Answer
Ensures a specified number of pod replicas run always.
### Follow-Up Points
- Deployment manages ReplicaSet  
### Example
replicas: 4

---

## Q6. Difference between Deployment & ReplicaSet?
### Answer
Deployment manages ReplicaSet; ReplicaSet only maintains replica count.
### Follow-Up Points
- Deployment = higher abstraction  
### Example
Deployment → RS → Pods.

---

## Q7. What is stateless and stateful?
### Answer
Stateless: no saved data. Stateful: persistent state required.
### Follow-Up Points
- Stateless easier to scale  
### Example
Nginx = stateless; MySQL = stateful.

---

## Q8. What is ClusterIP?
### Answer
Internal service for cluster-only communication.
### Follow-Up Points
- Default service type  
### Example
type: ClusterIP.

---

## Q9. What is NodePort?
### Answer
Exposes service on port of every node.
### Follow-Up Points
- Not secure for production  
### Example
nodePort: 30080.

---

## Q10. What is LoadBalancer?
### Answer
Creates external load balancer with public IP.
### Follow-Up Points
- Common for AKS  
### Example
type: LoadBalancer.

---

## Q11. What is Ingress?
### Answer
Layer-7 router to route external traffic based on host/path rules.
### Follow-Up Points
- Works with ingress controller  
### Example
/api → service1.

---

## Q12. Ingress vs LoadBalancer?
### Answer
LB exposes one service; Ingress exposes many services through one IP.
### Follow-Up Points
- Cheaper & scalable  
### Example
One IP with multiple routes.

---

## Q13. What are liveness probes?
### Answer
Check if app is alive.
### Follow-Up Points
- Restart container if fails  
### Example
httpGet probe.

---

## Q14. What are readiness probes?
### Answer
Check if pod is ready to serve traffic.
### Follow-Up Points
- Prevents traffic to unready pods  
### Example
tcpSocket.

---

## Q15. What are startup probes?
### Answer
Check slow-start applications.
### Follow-Up Points
- Runs before liveness  
### Example
startupProbe config.

---

## Q16. What is autoscaling?
### Answer
Automatic scale of pods/nodes based on metrics.
### Follow-Up Points
- HPA/VPA/Cluster autoscaler  
### Example
CPU > 70% → scale 2→5.

---

## Q17. What is HPA?
### Answer
Horizontal Pod Autoscaler—scales pods based on CPU/memory or custom metrics.
### Follow-Up Points
- Uses metrics-server  
### Example
kubectl autoscale.

---

## Q18. What is KEDA?
### Answer
Event-driven autoscaler for queues, Kafka, HTTP load.
### Follow-Up Points
- Scale to zero  
### Example
Kafka trigger scale.

---

## Q19. Explain YAML.
### Answer
Human-readable data structure used for Kubernetes manifests.
### Follow-Up Points
- Indentation matters  
### Example
apiVersion, kind, metadata, spec.

---

## Q20. What is metadata?
### Answer
Labels, name, namespace, annotations.
### Follow-Up Points
- Used by selectors  
### Example
metadata: labels: app: api.

---

## Q21. How do you check logs of pod?
### Answer
kubectl logs <pod-name>
### Follow-Up Points
- Use --previous for crashed pods  
### Example
kubectl logs -f pod.

---

## Q22. Check pod logs via GUI?
### Answer
Azure Portal → AKS → Workloads → Pods → Logs.
### Follow-Up Points
- Container insights  
### Example
Open container log stream.

---

## Q23. CrashLoopBackOff debugging?
### Answer
Check logs, events, container crash codes, missing env vars, secrets, bad image, failing probes.
### Follow-Up Points
- Fix startup exceptions  
### Example
kubectl describe pod.

EOF


###############################################
# 3. Docker.md
###############################################
cat > "$BASE/Docker.md" << 'EOF'
# Docker / Containers – United Layer

## Q1. What is Docker?
### Answer
Containerization platform to package apps with dependencies.
### Follow-Up Points
- Lightweight vs VM  
### Example
docker run nginx

---

## Q2. What is Dockerfile?
### Answer
Script used to build Docker images.
### Follow-Up Points
- Use multi-stage for optimization  
### Example
FROM node:18

---

## Q3. Dockerfile instructions?
### Answer
FROM, RUN, COPY, ADD, CMD, ENTRYPOINT, EXPOSE, ENV, WORKDIR.
### Follow-Up Points
- Best practice: small images  
### Example
RUN apt-get update.

---

## Q4. Multistage Dockerfile?
### Answer
Reduce image size by using separate build & runtime stages.
### Follow-Up Points
- Secure & lightweight  
### Example
FROM builder → FROM alpine.

---

## Q5. CMD vs ENTRYPOINT?
### Answer
CMD → default arguments  
ENTRYPOINT → fixed command.
### Follow-Up Points
- Combine both  
### Example
ENTRYPOINT ["python"]; CMD ["app.py"].

---

## Q6. ADD vs COPY?
### Answer
COPY: strict copy  
ADD: copy + URL + auto tar extract.
### Follow-Up Points
- Prefer COPY  
### Example
ADD file.tar.gz /tmp.

EOF

###############################################
# 4. Terraform.md
###############################################
cat > "$BASE/Terraform.md" << 'EOF'
# Terraform – United Layer

## Q1. What is Terraform?
### Answer
Infra-as-Code tool for declarative provisioning.
### Follow-Up Points
- Platform agnostic  
### Example
resource "azurerm_vnet".

---

## Q2. Why Terraform over ARM?
### Answer
Reusable modules, version control, multiplatform support, cleaner code.
### Follow-Up Points
- ARM = verbose  
### Example
Terraform modules reduce duplication.

---

## Q3. What is Terraform state file?
### Answer
Stores current infra state.
### Follow-Up Points
- Sensitive → secure it  
### Example
terraform.tfstate.

---

## Q4. How to secure Terraform state file?
### Answer
Remote backend, encryption, RBAC, soft delete, private endpoints.
### Follow-Up Points
- Azure Storage backend  
### Example
backend "azurerm".

---

## Q5. What is module?
### Answer
Reusable infra component folder.
### Follow-Up Points
- DRY code  
### Example
module "network" { source="./modules/network" }

---

## Q6. What is data source?
### Answer
Reads existing resources.
### Follow-Up Points
- Read-only  
### Example
data "azurerm_resource_group".

---

## Q7. What is null resource?
### Answer
Runs provisioners without creating infra.
### Follow-Up Points
- Helpful for scripts  
### Example
triggers = { always = timestamp() }

---

## Q8. What is backend?
### Answer
Location where state file is stored.
### Follow-Up Points
- Used for collaboration  
### Example
Azure Storage backend.

---

## Q9. How do you deploy infra using CI/CD?
### Answer
Pipeline → init → validate → plan → apply → approval → destroy.
### Follow-Up Points
- Use service connection  
### Example
Terraform tasks in Azure DevOps.

EOF

###############################################
# 5. Azure-Cloud.md
###############################################
cat > "$BASE/Azure-Cloud.md" << 'EOF'
# Azure Cloud – United Layer

## Q1. What is VMSS?
### Answer
Scales VM instances automatically.
### Follow-Up Points
- Works with load balancer  
### Example
Autoscale rule CPU > 70%.

---

## Q2. What is Application Gateway?
### Answer
Layer 7 load balancer with routing + WAF.
### Follow-Up Points
- SSL termination  
### Example
Path rule: /app → backend pool.

---

## Q3. What is NSG?
### Answer
Firewall filtering inbound & outbound traffic.
### Follow-Up Points
- Priority-based  
### Example
Allow 80; Deny all.

---

## Q4. How do you secure secrets?
### Answer
Use Key Vault, RBAC, private endpoints, managed identity.
### Follow-Up Points
- No secrets in YAML  
### Example
Key Vault integration with pipeline.

EOF


###############################################
# 6. Monitoring.md
###############################################
cat > "$BASE/Monitoring.md" << 'EOF'
# Monitoring – United Layer

## Q1. How do you monitor Kubernetes?
### Answer
Azure Monitor, Container Insights, Prometheus, Grafana.
### Follow-Up Points
- Check pod/node metrics  
### Example
kubectl top nodes.

---

## Q2. How do you monitor VMs?
### Answer
Azure Monitor, Log Analytics, diagnostic settings.
### Follow-Up Points
- Set alerts  
### Example
CPU > 80% alert.

---

## Q3. How do you monitor pods?
### Answer
kubectl top pod, container insights, dashboards.
### Follow-Up Points
- Review restarts  
### Example
kubectl get pods -o wide.

EOF

###############################################
# 7. CI-CD.md
###############################################
cat > "$BASE/CI-CD.md" << 'EOF'
# CI/CD – United Layer

## Q1. What is Azure Pipeline?
### Answer
CI/CD workflow for build, test, and deployment automation.
### Follow-Up Points
- YAML based  
### Example
trigger: main.

---

## Q2. Draft pipeline in YAML?
### Answer
Define stages → jobs → tasks → environment → approvals.
### Follow-Up Points
- Reusable templates  
### Example
stages: build → deploy.

---

## Q3. How to deploy containers using pipeline?
### Answer
Build image → push to ACR → kubectl/Helm deploy.
### Follow-Up Points
- Use service connection  
### Example
az acr build.

---

## Q4. CI/CD with Kubernetes?
### Answer
Push image → update manifests → rollout deployment → verify health.
### Follow-Up Points
- Rolling updates  
### Example
kubectl set image.

EOF

###############################################
# 8. Git.md
###############################################
cat > "$BASE/Git.md" << 'EOF'
# Git – United Layer

## Q1. Git Fetch vs Git Pull?
### Answer
Fetch = download  
Pull = fetch + merge.
### Follow-Up Points
- Pull may cause conflicts  
### Example
git fetch origin.

---

## Q2. What is merge conflict?
### Answer
Conflict in code versions during merge.
### Follow-Up Points
- Happens when editing same line  
### Example
Resolve manually.

EOF

###############################################
# 9. DevOps-Concepts.md
###############################################
cat > "$BASE/DevOps-Concepts.md" << 'EOF'
# DevOps Concepts – United Layer

## Q1. What is DevOps?
### Answer
Combination of development & operations to achieve faster delivery.
### Follow-Up Points
- Automation + collaboration  
### Example
CI/CD → AKS deployment.

---

## Q2. What is automation?
### Answer
Eliminating manual work using scripts & pipelines.
### Follow-Up Points
- Improves reliability  
### Example
Terraform + YAML pipelines.

---

## Q3. What is configuration management?
### Answer
Managing system configs consistently.
### Follow-Up Points
- Tools: Ansible, Chef  
### Example
Automated server configuration.

EOF

###############################################
# 10. Troubleshooting.md
###############################################
cat > "$BASE/Troubleshooting.md" << 'EOF'
# Troubleshooting – United Layer

## Q1. Pod crashing — how do you debug?
### Answer
Check logs, events, probes, env vars, images, secrets, ports.
### Follow-Up Points
- Check exit code  
### Example
kubectl logs --previous.

---

## Q2. Developer unable to push code?
### Answer
Check repo permissions, branch policies, authentication, token expiry.
### Follow-Up Points
- Validate Azure DevOps access  
### Example
Reset PAT.

---

## Q3. Pipeline failing?
### Answer
Check logs, variables, service connections, YAML indentation, permissions.
### Follow-Up Points
- Validate agent  
### Example
Re-run failed stage.

---

## Q4. VM connectivity issue?
### Answer
Check NSG, firewall, IP, DNS, SSH/RDP settings, NIC issues.
### Follow-Up Points
- Use Serial Console  
### Example
Reset NIC.

---

## Q5. Application slow after deployment?
### Answer
Check CPU, memory, logs, backend health, scaling, probes, disk I/O.
### Follow-Up Points
- Use App Insights  
### Example
Check response times.

EOF

echo "United Layer – All markdown files created successfully!"
