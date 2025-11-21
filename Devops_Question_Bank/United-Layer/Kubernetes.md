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

