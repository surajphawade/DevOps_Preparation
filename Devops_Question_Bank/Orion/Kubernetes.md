# Kubernetes – Orion

## Q1. What is the Kubernetes cluster you are using?
### Answer
AKS cluster with autoscaling & monitoring enabled.
### Follow-Up Points
- Version + node pool info  
### Example
1 system + 1 user node pool.

---

## Q2. How are your pods deployed?
### Answer
Using deployment YAML, Helm charts, CI/CD automation.
### Follow-Up Points
- Rolling updates  
### Example
kubectl apply -f deployment.yaml

---

## Q3. What is a service?
### Answer
Abstraction exposing pods.
### Follow-Up Points
- Stable endpoint  
### Example
ClusterIP → internal.

---

## Q4. Difference between ClusterIP, NodePort, LoadBalancer?
### Answer
ClusterIP = internal  
NodePort = expose on node  
LoadBalancer = external endpoint.
### Follow-Up Points
- LB is common for AKS  
### Example
LoadBalancer → public IP.

---

## Q5. What is Ingress?
### Answer
Layer-7 router controlling traffic routing using host/path rules.
### Follow-Up Points
- Works with ingress controller  
### Example
/api → service A.

---

## Q6. Ingress vs LoadBalancer?
### Answer
LoadBalancer: exposes one service externally.  
Ingress: routes many services through one entry point.
### Follow-Up Points
- Cheaper, flexible  
### Example
One IP → many microservices.

---

## Q7. Deployment strategies?
### Answer
Recreate, Rolling, Blue-Green, Canary.
### Follow-Up Points
- Rolling is default  
### Example
strategy: RollingUpdate

---

## Q8. What is autoscaling?
### Answer
Automatically increases/decreases resources based on load.
### Follow-Up Points
- HPA/VPA/CAS  
### Example
CPU > 70% → scale 2→4 pods.

---

## Q9. What is HPA?
### Answer
Horizontal Pod Autoscaler scales pods based on CPU/memory.
### Follow-Up Points
- Works with metrics API  
### Example
kubectl autoscale deployment.

---

## Q10. What is KEDA?
### Answer
Event-based autoscaler (Kafka, queues, HTTP).
### Follow-Up Points
- Scales to zero  
### Example
Kafka trigger scaling.

---

## Q11. What is StatefulSet?
### Answer
Manages stateful applications with stable network identities.
### Follow-Up Points
- Ordered startup  
### Example
Databases, Zookeeper.

---

## Q12. What is ReplicaSet?
### Answer
Maintains desired number of pod replicas.
### Follow-Up Points
- Deployment uses replicaset  
### Example
replicas: 3

---

## Q13. Stateful vs Stateless?
### Answer
Stateless = no local data  
Stateful = needs persistent identity.
### Follow-Up Points
- StatefulSet for DB  
### Example
Nginx = stateless; MySQL = stateful.

