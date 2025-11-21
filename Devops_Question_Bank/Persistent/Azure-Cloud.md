# Azure Cloud – Persistent Systems Interview Questions

## Q1. What are resource groups and how are you using them?
### Answer
Resource Groups are logical containers to organize and manage Azure resources like VMs, networks, and storage accounts.
### Follow-Up Points
- Used for lifecycle management  
- Apply RBAC at RG level  
- Apply policies, locks, and tags
### Example
RG per environment: dev-rg, stage-rg, prod-rg.

---

## Q2. Have you ever worked on Azure Monitor?
### Answer
Yes — Azure Monitor collects logs, metrics, alerts, and insights for applications and infrastructure.
### Follow-Up Points
- Container Insights for AKS  
- Application Insights for app telemetry  
- Create alerts, dashboards
### Example
Use Kusto queries in Log Analytics workspace.

---

## Q3. How can we set up RBAC in Azure?
### Answer
Assign RBAC roles to users, groups, or identities at subscription, resource group, or resource level.
### Follow-Up Points
- Principle of least privilege  
- Use built-in roles like Contributor, Reader  
- Use custom roles if necessary
### Example
az role assignment create --assignee <ID> --role "Contributor" --scope <RG>

---

## Q4. How do you configure autoscaling in AKS using Azure native tools?
### Answer
Enable Cluster Autoscaler and HPA (Horizontal Pod Autoscaler).
### Follow-Up Points
- metrics-server required  
- HPA scales pods  
- Cluster Autoscaler adds/removes nodes
### Example
kubectl autoscale deployment myapp --cpu-percent=50 --min=2 --max=10

---

## Q5. How does autoscaling work?
### Answer
Autoscaling monitors metrics and scales resources automatically when thresholds are exceeded.
### Follow-Up Points
- Pod autoscaling based on CPU/memory/custom metrics  
- Node autoscaling checks pending pods  
- Scale-out and scale-in logic
### Example
HPA scales pods when CPU > 70%.

---

## Q6. What are the uses of Azure Functions?
### Answer
Azure Functions allow running serverless compute that auto-scales on demand for event-driven workloads.
### Follow-Up Points
- Supports triggers (HTTP, Timer, Queue)  
- Cost-effective (pay per execution)  
- Used for automation tasks
### Example
Timer-triggered function executes cleanup script daily.

---

## Q7. How do you secure secrets in Azure?
### Answer
Use Key Vault with RBAC or Access Policies, enable firewalls, use private endpoints, and access secrets via Managed Identity.
### Follow-Up Points
- Enable soft delete + purge protection  
- Do not store secrets in app config  
- Rotate secrets regularly
### Example
App retrieves secrets using Azure Managed Identity (no passwords required).

