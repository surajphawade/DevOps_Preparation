# Monitoring & Logging – Capgemini Interview Questions

## Q1. How do you check the logs of a pod through GUI?
### Answer
Use Kubernetes dashboard, Lens, Azure Monitor (Container Insights), or cloud provider UI for pod-level logs.
### Follow-Up Points
- GUI provides real-time log streaming  
- Add filters for severity levels  
- Useful when CLI not available
### Example
Azure Portal → Monitor → Containers → Select Pod → View Live Logs

---

## Q2. What monitoring tools are you familiar with?
### Answer
Azure Monitor, Log Analytics, Prometheus-Grafana, ELK (Elasticsearch, Logstash, Kibana), and Datadog.
### Follow-Up Points
- Use alerts and dashboards  
- Collect metrics + logs + traces  
- Enable APM for deep monitoring
### Example
Grafana dashboard built using Prometheus metrics for CPU, memory, API latency.
