# Kubernetes – EPAM

## Q1. What are different kinds of probes?
### Answer
Liveness, Readiness, and Startup probes.
### Follow-Up Points
- Prevents faulty pods from serving traffic  
### Example
httpGet probe in deployment.yaml

---

## Q2. What are taints & tolerations?
### Answer
Taints restrict pods from scheduling; Tolerations allow specific pods to be scheduled on tainted nodes.
### Follow-Up Points
- Used for node isolation  
### Example
node-role.kubernetes.io/master:NoSchedule

---

## Q3. How does Kubernetes DNS work?
### Answer
Kube-DNS/CoreDNS resolves service names inside the cluster.
### Follow-Up Points
- Pod → service discovery  
### Example
ping service-name.namespace.svc.cluster.local

---

## Q4. What is service.yaml and how do you use it?
### Answer
Defines how a Kubernetes service exposes an application.
### Follow-Up Points
- Types: ClusterIP, NodePort, LB  
### Example
kind: Service  
spec: type: LoadBalancer

---

## Q5. What is metadata?
### Answer
Metadata contains identifiers like name, namespace, labels, and annotations.
### Follow-Up Points
- Helps in selection & organization  
### Example
metadata: labels: app: frontend

---

## Q6. How to check logs of pod through GUI?
### Answer
Azure Portal → AKS → Workloads → Pods → Logs.
### Follow-Up Points
- Uses Kubernetes dashboard  
### Example
Check container stderr/stdout.

