# Kubernetes – HCL Interview Questions

## Q1. If a pod is in pending state, how will you troubleshoot?
### Answer
Check node resource availability, PVC binding, taints/tolerations, image pull issues, or network policies blocking scheduling.
### Follow-Up Points
- kubectl describe pod  
- kubectl get events  
- Check storage class  
- Check node capacity & taints
### Example
kubectl describe pod myapp-pod

---

## Q2. What is stateless and stateful in K8s?
### Answer
Stateless apps do not persist data (Deployment). Stateful apps need persistent volumes, stable identities (StatefulSet).
### Follow-Up Points
- StatefulSet pod names: pod-0, pod-1  
- Uses PVC templates  
- Stateful = DBs, queues
### Example
StatefulSet for MongoDB.

---

## Q3. How to maintain Kubernetes cluster?
### Answer
Regular upgrades, monitoring, autoscaling, node replacement, security patches, and backup strategy.
### Follow-Up Points
- Use Prometheus/Grafana  
- Rotate certificates  
- Update node images  
- Monitor workload health
### Example
AKS upgrade via az aks upgrade.

---

## Q4. How to upgrade Kubernetes cluster?
### Answer
Drain nodes → upgrade control plane → upgrade node pool → uncordon nodes.
### Follow-Up Points
- Check compatibility matrix  
- Test upgrade in non-prod first  
- Use surge upgrades for AKS
### Example
az aks upgrade --resource-group rg --name aks --kubernetes-version 1.28

---

## Q5. Difference between VM and VMSS?
### Answer
VM = standalone compute instance.  
VMSS = scalable set of VMs with autoscaling on demand.
### Follow-Up Points
- VMSS integrates with load balancers  
- Supports zone redundancy  
- Better for K8s node pools
### Example
AKS worker nodes run on VMSS.

---

## Q6. Requirement to create two VMs and two DBs — choose VM or VMSS? Why?
### Answer
Use individual VMs if workloads are static; use VMSS when workloads require scaling and uniform configuration.
### Follow-Up Points
- VMSS ideal for identical node patterns  
- VM for specialized machines  
- DBs typically not in VMSS
### Example
2 DB servers → use standalone VMs, not VMSS.

---

## Q7. Taint & toleration (implied)
### Answer
Taints prevent pod scheduling on certain nodes; tolerations allow specific pods to run on tainted nodes.
### Follow-Up Points
- Used for node isolation  
- Good for workloads needing special hardware
### Example
kubectl taint nodes node1 dedicated=true:NoSchedule

