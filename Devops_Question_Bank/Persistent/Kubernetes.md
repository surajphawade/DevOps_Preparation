# Kubernetes – Persistent Systems Interview Questions

## Q1. You’re managing a deployment but don't know which secrets are used. How do you retrieve them?
### Answer
Inspect the pod/deployment spec, check mounted volumes, envFrom, or annotations, and list secrets in the namespace.
### Follow-Up Points
- kubectl describe deployment  
- Look for env or secretKeyRef  
- Check ConfigMaps + secret mounts  
- Ensure RBAC allows viewing secrets
### Example
kubectl get secret  
kubectl describe deploy myapp

---

## Q2. How does Kubernetes handle service discovery?
### Answer
Kubernetes uses cluster DNS to allow services to resolve via `<service-name>.<namespace>.svc.cluster.local`.
### Follow-Up Points
- kube-dns or CoreDNS handles DNS  
- Services get virtual IPs (ClusterIP)  
- Pods discover services automatically
### Example
curl http://app-service.default.svc.cluster.local

---

## Q3. What is Stateful (StatefulSet)?
### Answer
StatefulSet manages stateful workloads with stable identities, persistent volumes, and ordered, unique pod names.
### Follow-Up Points
- Used for DBs and message brokers  
- Pod names: pod-0, pod-1  
- PersistentVolumeClaims auto-created
### Example
StatefulSet for PostgreSQL cluster.

---

## Q4. Difference between Deployment, StatefulSet & ReplicaSet?
### Answer
- Deployment → stateless, scaling, rolling updates  
- StatefulSet → stable identity + volumes  
- ReplicaSet → ensures desired pod count
### Follow-Up Points
- Deployments use ReplicaSets internally  
- StatefulSets maintain pod order  
- ReplicaSet rarely used directly
### Example
kubectl get deploy / sts / rs

---

## Q5. How do you use service.yaml?
### Answer
A service.yaml defines how a set of pods is exposed using ClusterIP, NodePort, or LoadBalancer.
### Follow-Up Points
- selector matches pod labels  
- stable virtual IP created  
- used for internal/external networking
### Example
apiVersion: v1  
kind: Service  
spec:  
  type: LoadBalancer  
  selector: { app: myapp }

---

## Q6. Types of services in Kubernetes?
### Answer
ClusterIP, NodePort, LoadBalancer, ExternalName, and Headless service.
### Follow-Up Points
- ClusterIP default for internal traffic  
- NodePort opens port on nodes  
- Headless used for StatefulSets
### Example
spec: { type: NodePort }

---

## Q7. How do you enable monitoring in Kubernetes?
### Answer
Use Prometheus + Grafana or cloud-native tools (Azure Monitor/Container Insights).
### Follow-Up Points
- Use metrics-server for HPA  
- Collect logs with FluentD/Elastic  
- Enable OOM/CPU alerts
### Example
helm install prometheus-community/kube-prometheus-stack

---

## Q8. Troubleshooting CrashLoopBackOff error in pods — approach?
### Answer
Check logs (current and previous), resource limits, startup commands, env variables, image pull issues, and probe failures.
### Follow-Up Points
- kubectl logs -p  
- Describe pod for probe failures  
- Check container exit code  
- Fix misconfiguration
### Example
kubectl logs mypod --previous

