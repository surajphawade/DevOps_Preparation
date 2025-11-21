# Azure / Cloud – Capgemini Interview Questions

## Q1. What are App Services in Azure?
### Answer
App Service is a Platform-as-a-Service for hosting web apps, APIs, and mobile backends.
### Follow-Up Points
- Managed hosting (patching, scaling)  
- Supports multiple runtimes (Node, .NET, Python)  
- Use deployment slots for zero-downtime
### Example
Use Azure Portal or az webapp deploy to push code.

---

## Q2. How would you deploy an app using App Service?
### Answer
Use Azure DevOps/GitHub Actions, zip deploy, or direct Git deployment to App Service.
### Follow-Up Points
- Configure app settings for env variables  
- Use deployment slots for staging → prod swap  
- Monitor via Application Insights
### Example
az webapp deploy --name myapp --resource-group rg --src-path ./app.zip

---

## Q3. What is a service endpoint?
### Answer
Service endpoint allows secure direct access from a VNet to Azure PaaS services over Azure backbone.
### Follow-Up Points
- Simpler than private endpoints but not fully private IP  
- Useful to restrict public access
### Example
Enable Microsoft.Storage service endpoint on VNet subnet.

---

## Q4. What is a private endpoint?
### Answer
Private Endpoint assigns a private IP from your VNet to a PaaS resource so traffic stays within VNet.
### Follow-Up Points
- Requires DNS change (private zone)  
- Provides full private connectivity
### Example
Create private endpoint for Storage Account with private DNS zone.

---

## Q5. What is Application Gateway?
### Answer
A layer-7 load balancer with features like path-based routing and WAF.
### Follow-Up Points
- SSL termination  
- Integration with AKS via AGIC  
- URL-based routing and redirection
### Example
Application Gateway routing rules map path /app1 → backend pool 1.

---

## Q6. What is NSG and its priority?
### Answer
NSG (Network Security Group) contains security rules; priority is an integer (100–4096) where lower values are evaluated first.
### Follow-Up Points
- Default rules exist (allow VNet, allow AzureLoadBalancer, deny all inbound)  
- Use specific priorities carefully
### Example
Rule with priority 100 to allow SSH from jumpbox.

---

## Q7. How to restrict a service on a resource?
### Answer
Use RBAC, Azure Policy, NSGs, private endpoints, and resource locks.
### Follow-Up Points
- Azure Policy enforces rules across subscriptions  
- Resource locks prevent accidental delete/update
### Example
Assign Reader role to user for least privilege.

---

## Q8. Network topology you worked on?
### Answer
Common topologies: hub-spoke (central shared services) or single flat VNet for small setups.
### Follow-Up Points
- Hub contains shared infra (firewall, hub logging)  
- Spokes isolate workloads and peered to hub
### Example
Hub VNet peered with spoke VNets; shared DNS and logging in hub.

---

## Q9. How to connect on-prem application to cloud?
### Answer
Use Site-to-Site VPN Gateway for encrypted internet connectivity or ExpressRoute for private high-throughput connectivity.
### Follow-Up Points
- Consider latency, bandwidth, SLA  
- Use BGP with ExpressRoute for routing
### Example
Site-to-site VPN with local gateway and virtual network gateway.

---

## Q10. Where do you store secrets?
### Answer
Azure Key Vault for secrets, keys, and certificates.
### Follow-Up Points
- Use Managed Identity or SP to access Key Vault  
- Enable soft-delete and purge protection
### Example
Store DB password as a Key Vault secret and fetch at runtime.

---

## Q11. How to call Key Vault value via Service Principal with Terraform?
### Answer
Grant the service principal GET access on the Key Vault; use `data "azurerm_key_vault_secret"` in Terraform.
### Follow-Up Points
- Keep SP creds secure (use secret store)  
- Avoid printing secrets in logs
### Example
data "azurerm_key_vault_secret" "dbpass" { name = "db-pass" key_vault_id = azurerm_key_vault.kv.id }

