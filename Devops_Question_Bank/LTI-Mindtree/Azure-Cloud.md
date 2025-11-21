# Azure Cloud – LTI Mindtree Interview Questions

## Q1. What services have you used in Azure?
### Answer
Common Azure services include VMs, VNet, Load Balancers, App Services, Key Vault, Storage Accounts, Azure SQL, Azure Monitor, AKS, and Automation Accounts.
### Follow-Up Points
- Mention Infra + DevOps + Security services  
- Emphasize hands-on experience  
- Explain real use cases from your project
### Example
VM + VNet + NSG + Storage + Key Vault + Monitor + App Gateway + Azure DevOps integration.

---

## Q2. How do you connect your VM with private IP?
### Answer
Use tools like Azure Bastion, VPN, ExpressRoute, or Jumpbox VM to access private IP machines securely.
### Follow-Up Points
- Never assign public IP in production  
- Use Bastion for direct browser RDP/SSH  
- Use NSG rules to restrict inbound access
### Example
Laptop → VPN → VNet → Private VM (10.x.x.x)

---

## Q3. What is Application Gateway?
### Answer
Azure Application Gateway is a Layer-7 load balancer that handles HTTP/HTTPS traffic with features like SSL termination, WAF, URL routing, and session affinity.
### Follow-Up Points
- Works at OSI Layer 7  
- Supports WAF  
- Supports path-based and host-based routing
### Example
/api/* → backend1,  
/frontend/* → backend2.

---

## Q4. How do you patch your VM?
### Answer
Use Azure Update Management (Automation Account), Azure Guest Patching, or custom scripts to automatically install OS updates.
### Follow-Up Points
- Schedule patch window  
- Review compliance reports  
- Use Log Analytics for reporting
### Example
Automation Account → Update Management → Patch schedule.

---

## Q5. What is swap space in Linux VM?
### Answer
Swap space is disk-based memory used when RAM is full. It acts as overflow to prevent OOM issues.
### Follow-Up Points
- Slower than RAM  
- Not recommended for heavy workloads  
- Can be swapfile or swap partition
### Example
sudo swapon --show

---

## Q6. Where do you get Azure service update announcements?
### Answer
Microsoft Learn, Azure Updates page, Azure Blog, and GitHub release notes.
### Follow-Up Points
- Official source: https://azure.microsoft.com/updates  
- Subscribe to RSS or email  
- Preview features listed separately
### Example
Search: “Azure Updates – Virtual Machines”.

---

## Q7. Where are your VMs located? Which region?
### Answer
The region refers to the Azure datacenter location where your resources are deployed.
### Follow-Up Points
- Use region closest to users  
- Follow data residency requirements  
- Avoid cross-region latency
### Example
East US, Central India, West Europe, etc.

---

## Q8. Where is your DR server located?
### Answer
DR (Disaster Recovery) is typically in a paired region or secondary region to ensure failover capability.
### Follow-Up Points
- Use Azure paired regions  
- Replicate using ASR or Backup Vault  
- Maintain RTO/RPO targets
### Example
Primary: East US  
DR: West US

---

## Q9. What is the difference between Automation Account and Function App?
### Answer
Automation Account is used for runbooks/patching/orchestration.  
Function App is serverless code execution for event-driven tasks.
### Follow-Up Points
- Automation Account = infra automation  
- Function App = event-triggered workloads  
- Both can run PowerShell/Python
### Example
Automation Account: VM patching  
Function App: Trigger on blob upload.

---

## Q10. How do you horizontally scale your App Services?
### Answer
Use App Service Scale-Out to increase the number of instances based on metrics like CPU, memory, or HTTP queue length.
### Follow-Up Points
- Auto-scale rule needed  
- Minimum and maximum instances  
- Useful for load-based scaling
### Example
CPU > 70% → scale-out to 5 instances.

---

## Q11. How do you access storage accounts securely?
### Answer
Use Private Endpoints, Azure RBAC, Shared Access Signatures (SAS), Managed Identity, and firewall rules.
### Follow-Up Points
- Disable public access  
- Use network rules  
- Use Key Vault for SAS rotation
### Example
Storage → Networking → Private Endpoint → VNet.

---

## Q12. What is KQL query? Give one example.
### Answer
KQL (Kusto Query Language) is used to query Azure Monitor logs, Log Analytics, and Application Insights.
### Follow-Up Points
- Similar to SQL but optimized for logs  
- Supports filtering, summarizing, joins  
- Used in dashboards & alerts
### Example
Heartbeat  
| where TimeGenerated > ago(1h)  
| summarize count() by Computer

---

## Q13. What is the difference between Azure SQL and On-Prem SQL?
### Answer
Azure SQL is a managed database service; Microsoft manages OS, patches, backups, high availability. On-prem SQL requires full manual management.
### Follow-Up Points
- Built-in HA + backups  
- No OS-level access  
- Scales easily  
- Pay-as-you-go pricing
### Example
Azure SQL auto backup with point-in-time restore.

---

## Q14. How have you set up monitoring for VMs?
### Answer
Use Azure Monitor + Log Analytics Agent/AMA to collect metrics and logs.
### Follow-Up Points
- Enable diagnostics extension  
- Monitor CPU, disk, network  
- Create alerts for threshold breaches
### Example
Send logs to Log Analytics Workspace and query using KQL.

---

## Q15. How will you configure monitoring using Azure Monitor?
### Answer
Enable metrics, diagnostic settings, log ingestion, alerts, and dashboards.
### Follow-Up Points
- Use custom log queries  
- Enable VM insights  
- Integrate with Grafana/Splunk
### Example
Diagnostic Settings → Send to Log Analytics + Storage + EventHub.

---

## Q16. How do you set up alerting in Azure DevOps?
### Answer
Use pipeline alerts, branch policy alerts, or Azure Monitor integration for infra alerts.
### Follow-Up Points
- Alerts via email/Teams  
- Monitor pipeline failure  
- Integrate with ServiceNow
### Example
Notifications → Create Subscription → Build Failed.

---

## Q17. How do you collect data from the VM?
### Answer
Using Log Analytics Agent / Azure Monitor Agent, Custom Script, or REST APIs.
### Follow-Up Points
- Collect metrics (CPU, memory)  
- Collect syslogs/windows event logs  
- Store in Log Analytics
### Example
AMA → connects VM → sends logs to LAW.

---

## Q18. How do you set up Splunk + monitoring?
### Answer
Install Splunk forwarder on VMs, configure inputs.conf, and send logs to Splunk indexers.
### Follow-Up Points
- Use HEC tokens  
- Integrate Azure Monitor via EventHub  
- Use UF/UF+TA for Azure logs
### Example
UF → sends syslogs → Splunk index.

