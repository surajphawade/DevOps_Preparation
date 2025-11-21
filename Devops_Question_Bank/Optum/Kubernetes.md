# Kubernetes – Optum

## Q1. Stateful vs Stateless.
### Answer
Stateless apps don’t keep data; Stateful apps store persistent data.
### Follow-Up Points
- StatefulSet vs Deployment  
### Example
DB → StatefulSet.

---

## Q2. ClusterIP, NodePort, LoadBalancer.
### Answer
ClusterIP = internal  
NodePort = expose on node  
LoadBalancer = external IP.
### Follow-Up Points
- AKS supports all three  
### Example
service: type: LoadBalancer

---

## Q3. Types of services in Kubernetes.
### Answer
ClusterIP, NodePort, LoadBalancer, ExternalName.
### Follow-Up Points
- Default = ClusterIP  

---

## Q4. How to enable monitoring?
### Answer
Enable Container Insights or Prometheus/Grafana.
### Follow-Up Points
- Use Log Analytics  
### Example
Enable Monitoring while creating AKS.

---

## Q5. CrashLoopBackOff?
### Answer
Container repeatedly crashes due to failure in startup, config, or dependencies.
### Follow-Up Points
- Check logs  
- Check probe failures  
### Example
kubectl logs pod --previous

---

## Q6. How do you check probes?
### Answer
Describe pod → check readiness & liveness probe configuration.
### Follow-Up Points
- Review thresholds  
### Example
kubectl describe pod.

---

## Q7. Types of probes.
### Answer
Liveness, Readiness, Startup.
### Follow-Up Points
- Prevent faulty deployments  
### Example
httpGet probe.

---

## Q8. What is pod?
### Answer
Smallest deployable object containing containers.
### Follow-Up Points
- One or more containers  
### Example
kubectl get pods.

---

## Q9. Check pod logs via GUI?
### Answer
Azure Portal → AKS → Workloads → Pods → Logs.
### Follow-Up Points
- Uses Kubernetes dashboard integration  
### Example
Portal-based log viewer.

