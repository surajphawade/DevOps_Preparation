# Kubernetes (AKS) – LTI Mindtree Interview Questions

## Q1. How did you configure AKS autoscaling?
### Answer
By enabling Cluster Autoscaler (node-level scaling) and HPA (Horizontal Pod Autoscaler for pods).
### Follow-Up Points
- HPA needs metrics-server  
- Cluster Autoscaler scales node pools  
- Use min/max node limits
### Example
kubectl autoscale deployment myapp --cpu-percent=70 --min=2 --max=10

---

## Q2. How did you do rolling update deployment?
### Answer
Using Deployment object with rolling update strategy that replaces pods gradually without downtime.
### Follow-Up Points
- use `maxSurge` and `maxUnavailable`  
- Check rollout status  
- Use readiness probes
### Example
kubectl rollout status deployment/myapp

---

## Q3. How did you configure load balancing in Kubernetes?
### Answer
Use LoadBalancer service or ingress controller (NGINX/App Gateway Ingress Controller).
### Follow-Up Points
- LoadBalancer creates external IP  
- Ingress allows path-based routing  
- AGIC integrates with Azure App Gateway
### Example
spec:  
  type: LoadBalancer  
  ports: [{ port: 80 }]

---

## Q4. Kubernetes YAML files — explain them.
### Answer
A YAML manifest defines desired configuration for Kubernetes objects like pods, deployments, services, and configmaps.
### Follow-Up Points
- apiVersion  
- kind  
- metadata  
- spec fields  
### Example
kind: Deployment  
spec: replicas: 3

---

## Q5. Secret management in Kubernetes.
### Answer
Use Kubernetes Secrets, external secrets (Azure Key Vault), or sealed secrets.
### Follow-Up Points
- Store secrets encoded (not encrypted)  
- RBAC restricts access  
- Use CSI driver for Key Vault integration
### Example
env:
- name: DB_PASS  
  valueFrom: secretKeyRef: { name: db, key: pass }

---

## Q6. What are taint & toleration?
### Answer
Taints restrict which pods can run on a node; tolerations allow specific pods to schedule on tainted nodes.
### Follow-Up Points
- Used for GPU/critical workloads  
- Helps isolate workloads  
### Example
kubectl taint nodes node1 env=prod:NoSchedule

---

## Q7. Explain Kubernetes architecture.
### Answer
Master components: API Server, Scheduler, Controller Manager, ETCD.  
Node components: Kubelet, Kube Proxy, Container Runtime.
### Follow-Up Points
- API Server = entry point  
- ETCD = key-value store  
- Scheduler assigns pods  
### Example
kubectl get componentstatuses

---

## Q8. Have you worked on AKS monitoring?
### Answer
Yes — using Container Insights, Prometheus + Grafana, and Azure Monitor metrics/logs.
### Follow-Up Points
- Collect pod logs  
- Monitor node/pod CPU & memory  
- Create alerts for failures
### Example
az aks enable-addons --addons monitoring

