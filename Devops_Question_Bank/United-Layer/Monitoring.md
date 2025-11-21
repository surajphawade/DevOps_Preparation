# Monitoring – United Layer

## Q1. How do you monitor Kubernetes?
### Answer
Azure Monitor, Container Insights, Prometheus, Grafana.
### Follow-Up Points
- Check pod/node metrics  
### Example
kubectl top nodes.

---

## Q2. How do you monitor VMs?
### Answer
Azure Monitor, Log Analytics, diagnostic settings.
### Follow-Up Points
- Set alerts  
### Example
CPU > 80% alert.

---

## Q3. How do you monitor pods?
### Answer
kubectl top pod, container insights, dashboards.
### Follow-Up Points
- Review restarts  
### Example
kubectl get pods -o wide.

