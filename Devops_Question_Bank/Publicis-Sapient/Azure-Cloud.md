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

