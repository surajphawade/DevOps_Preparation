# Kubernetes — Unknown / Mixed-Source Questions (Questions + Answers)

## Basics & Architecture

Q1. What is Kubernetes?
A1. Kubernetes is a container orchestration platform that automates deployment, scaling, and management of containerized applications.

Q2. What is pod?
A2. A pod is the smallest deployable unit in Kubernetes and can contain one or more containers that share network and storage.

Q3. What is Deployment?
A3. A Deployment manages stateless applications by creating ReplicaSets and enabling rolling updates.

Q4. What is StatefulSet?
A4. StatefulSet manages stateful applications that require stable network IDs and persistent storage.

Q5. Difference between Deployment and StatefulSet?
A5. Deployment is for stateless workloads and supports easy scaling; StatefulSet provides ordered, stable identities and persistent storage for each pod.

Q6. What is ReplicaSet?
A6. ReplicaSet ensures that a specified number of pod replicas are running at any time.

Q7. What is difference between ReplicaSet & Deployment?
A7. ReplicaSet maintains replica counts; Deployment manages ReplicaSets and strategy for updates.

## Services

Q8. What is ClusterIP?
A8. ClusterIP is the default internal-only service type exposing pods on a cluster-internal IP.

Q9. What is NodePort?
A9. NodePort exposes the service on a static port on each node’s IP for external access.

Q10. What is LoadBalancer?
A10. LoadBalancer provisions a cloud provider load balancer to expose the service externally.

Q11. What is Ingress?
A11. Ingress is an API object that manages external access to services, typically HTTP/HTTPS, with routing rules.

Q12. Difference between Ingress vs LoadBalancer?
A12. LoadBalancer exposes a single service with a public IP; Ingress routes traffic for multiple services through one entry point with L7 rules.

## Probes

Q13. What are liveness probes?
A13. Liveness probes detect if the application is alive — failing liveness triggers container restart.

Q14. What are readiness probes?
A14. Readiness probes indicate if a pod is ready to receive traffic; failing readiness removes pod from service endpoints.

Q15. What is startup probe?
A15. Startup probes allow slow-starting containers more time before liveness/readiness checks begin.

## Autoscaling

Q16. What is HPA?
A16. Horizontal Pod Autoscaler scales the number of pods based on observed metrics like CPU or custom metrics.

Q17. What is KEDA?
A17. KEDA is Kubernetes Event-driven Autoscaling that scales workloads based on external event sources (queues, Kafka, etc.).

## Troubleshooting

Q18. Pod is pending — how to troubleshoot?
A18. Check events (`kubectl describe pod`), node capacity, scheduling constraints, resource requests/limits, taints/tolerations, and PVC binding.

Q19. Pod in CrashLoopBackOff — steps to fix?
A19. Check pod logs, previous container logs, events, probe failures, environment variables, image compatibility, and resource limits.

Q20. How to check logs via CLI?
A20. Use `kubectl logs <pod>` (and `--previous` for crashed containers); `kubectl describe pod` for events.

Q21. How to check logs via GUI?
A21. Use provider console (Azure Portal → AKS → Workloads → Pods) or Kubernetes Dashboard / Log Analytics.

## YAML

Q22. What is YAML?
A22. YAML is a human-readable data-serialization language commonly used for Kubernetes manifests.

Q23. What is metadata?
A23. Metadata contains identity information such as name, namespace, labels, and annotations.

Q24. What is spec?
A24. `spec` defines the desired state of the resource (replicas, containers, ports, selectors).

Q25. Explain service.yaml.
A25. `service.yaml` defines a Service resource: `apiVersion`, `kind: Service`, `metadata`, and `spec` including `type`, `selector`, and ports.

