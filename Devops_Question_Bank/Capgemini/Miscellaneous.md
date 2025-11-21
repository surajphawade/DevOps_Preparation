# Miscellaneous – Capgemini Interview Questions

## Q1. Can you deploy and migrate from Azure to AWS? How and why?
### Answer
Yes. Use Terraform or cloud-agnostic IaC, containerized workloads, and cloud migration strategies.
### Follow-Up Points
- Use Terraform for both clouds  
- Recreate managed services equivalents  
- Migrate DB via replication/snapshot
### Example
Move Azure VM → Amazon EC2 using image export/import.

---

## Q2. How to store VM credentials in Azure Key Vault using Terraform?
### Answer
Create Key Vault → add secret → assign permissions to access secret.
### Follow-Up Points
- Always store secrets in Key Vault  
- Assign managed identity to VM to fetch secrets  
- Avoid storing plaintext in TF code
### Example
resource "azurerm_key_vault_secret" "vmcreds" {
  name  = "vm-password"
  value = "Pass@123"
}

---

## Q3. How to access secrets stored in Key Vault?
### Answer
Use SP or managed identity to authenticate and fetch secrets at runtime.
### Follow-Up Points
- Use SDK libraries  
- Rotate secrets  
- Apply RBAC or access policies
### Example
Azure SDK: kv_client.get_secret("db-pass")

---

## Q4. How many IPs in 192.168.1.0/32?
### Answer
/32 has exactly 1 IP and no usable host range.
### Follow-Up Points
- Used for host routes  
- Common for loopback addresses
### Example
CIDR: 255.255.255.255 → 1 IP.

---

## Q5. What access types do you see in Key Vault RBAC?
### Answer
Key Vault Reader, Secrets User, Crypto Officer, Key Vault Administrator, etc.
### Follow-Up Points
- RBAC vs Access Policy model  
- Prefer RBAC for unified access
### Example
Assign Key Vault Secrets User for app-level secret GET.

---

## Q6. SQL DB credentials stored in KV, you have owner access but cannot access — why?
### Answer
Owner on subscription does not auto-grant Key Vault secret GET permission.
### Follow-Up Points
- Add RBAC role or access policy  
- Check firewall/network rules
### Example
Add role: Key Vault Secrets User.

---

## Q7. What Azure services have you worked with?
### Answer
App Service, AKS, ACR, Azure SQL, Storage Account, VNet, Application Gateway, Key Vault, Monitor.
### Follow-Up Points
- Tailor based on real work  
- Mention automation with DevOps
### Example
Worked on AKS deployment + ACR integration.

---

## Q8. Day-to-day DevOps tasks?
### Answer
Monitoring pipelines, fixing deployment issues, provisioning infra with Terraform, and collaborating with development teams.
### Follow-Up Points
- Focus on automation  
- Incident management  
- Create runbooks/playbooks
### Example
Daily health checks on CI/CD pipelines and AKS workloads.

