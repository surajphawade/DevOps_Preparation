# Kubernetes – Capgemini Interview Questions

## Q1. What is an init container?
### Answer
An init container runs before the main application container to perform preparation tasks.
### Follow-Up Points
- Runs sequentially  
- Good for setup scripts  
- Ensures environment readiness
### Example
initContainers:
- name: init-script  
  image: busybox  
  command: ["sh","-c","echo init"]

---

## Q2. How to troubleshoot Pending pod?
### Answer
Check node resources, events, PVC binding, taints/tolerations, or image pull issues.
### Follow-Up Points
- kubectl describe pod  
- kubectl get nodes  
- Check StorageClass  
- Check network policies
### Example
kubectl describe pod mypod

---

## Q3. What is stateless vs stateful?
### Answer
Stateless apps do not persist data; stateful apps require persistent storage and stable identity.
### Follow-Up Points
- Stateless → Deployment  
- Stateful → StatefulSet  
- Data stored in PVCs
### Example
StatefulSet used for databases

---

## Q4. What is a Pod? Commands used?
### Answer
A Pod is the smallest deployable unit containing one or more containers.
### Follow-Up Points
- kubectl get pods  
- kubectl logs pod  
- kubectl exec -it pod -- sh  
- kubectl describe pod
### Example
kubectl logs mypod

---

## Q5. What are probes in Kubernetes?
### Answer
Probes are health checks for containers.
### Follow-Up Points
- Liveness → container alive?  
- Readiness → ready for traffic?  
- Startup → slow apps support
### Example
livenessProbe:  
  httpGet:  
    path: /health  
    port: 8080

---

## Q6. What is CrashLoopBackOff troubleshooting?
### Answer
Check logs, previous logs, resource limits, misconfiguration, and environment variables.
### Follow-Up Points
- kubectl logs -p  
- Check YAML  
- Increase CPU/memory  
- Image errors cause crash
### Example
kubectl logs mypod --previous

---

## Q7. If 10 VMs have 10 apps — how integrate Application Gateway?
### Answer
Use Application Gateway to route HTTP/HTTPS traffic to backend pools or use AGIC with AKS.
### Follow-Up Points
- Path-based routing  
- Host-based routing  
- WAF support  
- SSL termination
### Example
N/A

