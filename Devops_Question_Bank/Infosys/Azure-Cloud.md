# Azure Cloud Services – Infosys Interview Questions

## Q1. Have you worked with Azure Web App Services?
### Answer
Yes, App Services are PaaS offerings for hosting web apps and APIs.
### Follow-Up Points
- Deployment slots  
- Auto-scaling  
### Example
Deploy using “az webapp deploy”.

---

## Q2. Do you also work with PaaS services?
### Answer
Yes — App Services, SQL PaaS, Key Vault, Storage, Event Hub, Functions.
### Follow-Up Points
- Highlight managed services  
### Example
SQL PaaS → no OS maintenance.

---

## Q3. How do you provision SQL database?
### Answer
Use Azure SQL Database via portal, CLI, Terraform, or DevOps pipelines.
### Follow-Up Points
- Configure firewall rules  
- Use private endpoints  
### Example
az sql db create --name mydb

---

## Q4. Why SQL PaaS instead of SQL on VM?
### Answer
SQL PaaS handles patches, backups, HA, DR, and scaling automatically.
### Follow-Up Points
- No OS-level management  
- More secure  
### Example
Automated point-in-time restore.

---

## Q5. If database is deleted, how can we recover it?
### Answer
Azure SQL PaaS supports point-in-time restore and backup retention.
### Follow-Up Points
- Up to 35 days retention  
### Example
Restore from deleted server blade.

---

## Q6. How to connect SQL database with application?
### Answer
Use connection strings stored in Key Vault or App Settings.
### Follow-Up Points
- Use Managed Identity where possible  
### Example
SQL connection string → WebApp settings.

---

## Q7. What Azure services have you worked on?
### Answer
VMs, VNets, NSGs, App Services, SQL, Storage, Key Vault, ACR, AKS, Monitor.
### Follow-Up Points
- Mention real infra  
### Example
AKS + ACR + private endpoints.

