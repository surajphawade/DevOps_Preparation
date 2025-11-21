# Monitoring & Logging – Optum

## Q1. Monitor Azure VMs?
### Answer
Use Azure Monitor, VM insights, metrics, and alerts.
### Follow-Up Points
- Enable diagnostic logs  
### Example
CPU > 80% alert.

---

## Q2. How do you set alerts?
### Answer
Create alert rules in Azure Monitor → define metric → action groups.
### Follow-Up Points
- Email/SMS/Webhook  
### Example
Alert on AKS node down.

---

## Q3. What is Log Analytics?
### Answer
A centralized log platform for Azure monitoring.
### Follow-Up Points
- Uses KQL queries  
### Example
KQL: Heartbeat | summarize count().

---

## Q4. What is Application Insights?
### Answer
App performance monitoring for telemetry, logs, failures.
### Follow-Up Points
- Distributed tracing  
### Example
Dependency tracking for APIs.

