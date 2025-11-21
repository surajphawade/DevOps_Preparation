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

