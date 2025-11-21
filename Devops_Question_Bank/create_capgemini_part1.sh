#!/bin/bash
set -e

BASE="Publicis-Sapient"
mkdir -p "$BASE"

echo "Creating full Publicis Sapient folder with all markdown files..."

###############################################
# 1. Azure Cloud
###############################################
cat > "$BASE/Azure-Cloud.md" << 'EOF'
# Azure Cloud – Publicis Sapient Interview Questions

## Q1. What is VNet?
### Answer
A Virtual Network (VNet) is an isolated private network in Azure used to securely host resources like VMs, databases, containers, and applications.
### Follow-Up Points
- Logical isolation  
- Subnets, routing, NSG  
- Hybrid connectivity  
### Example
az network vnet create --name myvnet --address-prefix 10.0.0.0/16

---

## Q2. How are you balancing traffic in cloud?
### Answer
Traffic is balanced using Azure Load Balancer (Layer 4) or Application Gateway (Layer 7).
### Follow-Up Points
- LB = TCP/UDP  
- App Gateway = HTTP/HTTPS + WAF  
- Choose based on layer requirement  
### Example
App Gateway for HTTPS + path routing.

---

## Q3. How many types of load balancers?
### Answer
Azure provides:  
- Public Load Balancer  
- Internal Load Balancer  
- Application Gateway  
- Traffic Manager  
- Front Door
### Follow-Up Points
- Layer 4 vs Layer 7  
- Global vs regional  
### Example
Traffic Manager for global routing.

---

## Q4. What is priority in NSG?
### Answer
NSG rules use priority numbers to determine evaluation order (lower = higher priority).
### Follow-Up Points
- Range 100–4096  
- First match wins  
- Deny overrides allow  
### Example
Rule priority 100 blocks traffic first.

---

## Q5. What is service endpoint and private endpoint?
### Answer
Service Endpoint: Extends VNet identity to Azure services via Microsoft backbone.  
Private Endpoint: Allocates private IP to the service in your VNet.
### Follow-Up Points
- Private Endpoint = More secure  
- Blocks public access  
### Example
Private Endpoint for Storage Account.

---

## Q6. How do you securely access your resources?
### Answer
Use Private Endpoints, Bastion, RBAC, Managed Identity, NSG rules, and VPN/ExpressRoute.
### Follow-Up Points
- Disable public access  
- Use conditional access  
### Example
VM access via Azure Bastion.

---

## Q7. What is bastion host? Why is it used?
### Answer
Azure Bastion provides RDP/SSH access to VMs over SSL without needing public IPs.
### Follow-Up Points
- Secure alternative to public SSH/RDP  
- Integrated with portal  
### Example
VM → Connect → Bastion.

---

## Q8. What are NSG rules?
### Answer
NSG rules control inbound and outbound traffic to subnets or NICs.
### Follow-Up Points
- Priority-based  
- Source/destination/port/protocol  
### Example
Allow port 22 for Linux VMs.

---

## Q9. How do you restrict any service on a resource?
### Answer
Use NSG, route tables, firewall, private endpoints, RBAC, or policy to block/limit access.
### Follow-Up Points
- Best option depends on service type  
### Example
Deny inbound port 3389 for all users.

---

## Q10. What network topology have you worked with?
### Answer
Hub-Spoke, Mesh, or Flat topology.
### Follow-Up Points
- Hub hosts shared services  
- Spokes isolate workloads  
### Example
Hub → Firewall + VPN; Spokes → App, DB subnets.

---

## Q11. How do you connect your on-prem application to cloud?
### Answer
Use VPN Gateway or ExpressRoute for hybrid connectivity.
### Follow-Up Points
- Site-to-Site VPN  
- VNet peering for cloud-only  
### Example
On-prem firewall → VPN → Azure VNet.

EOF

###############################################
# 2. Terraform
###############################################
cat > "$BASE/Terraform.md" << 'EOF'
# Terraform – Publicis Sapient Interview Questions

## Q1. Where do you store your state file?
### Answer
Store state in a remote backend like Azure Storage, AWS S3, or Terraform Cloud.
### Follow-Up Points
- Enable encryption  
- Turn on soft delete + versioning  
### Example
backend "azurerm" { container_name="tfstate" }

---

## Q2. What is the lifecycle in Terraform?
### Answer
Lifecycle controls resource behavior using arguments like create_before_destroy, prevent_destroy, and ignore_changes.
### Follow-Up Points
- Avoid downtime  
- Protect against accidental deletes  
### Example
lifecycle { prevent_destroy = true }

---

## Q3. Pipeline failed after apply and got stuck in lock state — how do you resolve?
### Answer
Manually remove the lock from backend (Azure Storage lease or DynamoDB entry).
### Follow-Up Points
- Ensure no other apply is running  
- Use force-unlock as last option  
### Example
terraform force-unlock <lock-id>

---

## Q4. If calling variables from Key Vault but don’t want to mention them in pipeline or code?
### Answer
Use Managed Identity + Key Vault references to fetch secrets at runtime.
### Follow-Up Points
- Avoid plain-text variables  
- Use EnableSoftDelete for KV  
### Example
Terraform → MSI → Key Vault → Secret.

EOF

###############################################
# 3. CI/CD
###############################################
cat > "$BASE/CI-CD.md" << 'EOF'
# CI/CD – Publicis Sapient Interview Questions

## Q1. Condition: run pipeline only when dev passes 90%
### Answer
Use a conditional check in YAML based on code coverage or test results.
### Follow-Up Points
- Use variables from test stage  
- Use `condition:` in ADO YAML  
### Example
condition: and(succeeded(), eq(variables['coverage'], '90'))

EOF

###############################################
# 4. Scripting
###############################################
cat > "$BASE/Scripting.md" << 'EOF'
# Scripting – Publicis Sapient Interview Questions

## Q1. Shell script: alert if disk > 80%
### Answer
Check disk usage and send email when threshold is crossed.
### Follow-Up Points
- Use cron for scheduling  
- Use mail or sendmail  
### Example
#!/bin/bash
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if (( usage > 80 )); then
  echo "Disk above 80%" | mail -s "Alert" admin@example.com
fi

EOF

###############################################
# 5. General
###############################################
cat > "$BASE/General.md" << 'EOF'
# General – Publicis Sapient Interview Questions

## Q1. Introduce yourself.
### Answer
Give a short intro including your role, years of experience, cloud stack, DevOps tools, and achievements.
### Follow-Up Points
- Keep within 60 seconds  
- Mention certifications  
### Example
“I work with Azure, Terraform, CI/CD, AKS, and automation.”

---

## Q2. Tell me about your recent project.
### Answer
Describe architecture, responsibilities, tools used, challenges, and improvements you delivered.
### Follow-Up Points
- Explain infrastructure workflow  
- Highlight real scenarios  
### Example
Terraform → AKS → ACR → Monitoring → CI/CD pipeline.

EOF

echo "Publicis Sapient – All Markdown Files Created Successfully!"
