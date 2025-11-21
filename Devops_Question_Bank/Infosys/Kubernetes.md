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

