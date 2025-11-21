# Networking / Azure Infrastructure – HCL Interview Questions

## Q1. What is availability set in Azure?
### Answer
An availability set ensures VM redundancy by distributing VMs across multiple fault domains and update domains.
### Follow-Up Points
- Minimum 2 VMs recommended  
- Protects from hardware failure & patching downtime  
- Not used for AKS nodes (VMSS used instead)
### Example
VM1 → FD0 / UD0  
VM2 → FD1 / UD1

---

## Q2. What is peering?
### Answer
VNet peering connects two VNets so they can communicate privately with low latency.
### Follow-Up Points
- Supports global peering  
- Peering is non-transitive  
- Must configure both sides
### Example
az network vnet peering create ...

---

## Q3. How do you manage multiple subscriptions?
### Answer
Use Management Groups, separate service principals, Azure Lighthouse, and subscription-scoped RBAC.
### Follow-Up Points
- Tag subscriptions  
- Use separate tfvars per subscription  
- Use provider alias for multi-subscription deployments
### Example
provider "azurerm" { alias = "sub2" subscription_id="..." }

---

## Q4. How will you manage 1500 subscriptions from ADO level?
### Answer
Use Azure Lighthouse delegation + service principal with multi-tenant permissions + templates to dynamically select subscription in pipeline.
### Follow-Up Points
- Use management group level definitions  
- Use parameterized pipelines  
- Keep SP least-privileged
### Example
az account set --subscription $SUB_ID

---

## Q5. How can we stop outgoing traffic from Azure VM without NSG?
### Answer
Use a user-defined route (UDR) that sends traffic to a null route or custom firewall appliance. You can also disable NIC public IP or restrict outbound via Azure Firewall.
### Follow-Up Points
- UDR → next hop = None  
- Useful when NSG can’t be used  
- Disable IP forwarding if unwanted
### Example
Route table → 0.0.0.0/0 → None (blackhole)

