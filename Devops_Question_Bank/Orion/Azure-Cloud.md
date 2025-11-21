# Azure Cloud – Orion

## Q1. What Azure services used in project?
### Answer
VMs, VNets, App Gateway, ACR, AKS, Key Vault, Monitor.
### Follow-Up Points
- Link to architecture  
### Example
AKS + ACR + Key Vault.

---

## Q2. What is VMSS?
### Answer
Scale set for autoscaling VMs.
### Follow-Up Points
- Load balanced  
### Example
VMSS autoscale rule.

---

## Q3. Used Azure Load Balancer?
### Answer
Yes — for distributing traffic across VMs/VMSS.
### Follow-Up Points
- Layer 4  
### Example
Frontend IP + backend pool.

---

## Q4. Application Gateway?
### Answer
Layer 7 load balancer with WAF.
### Follow-Up Points
- Path routing  
### Example
/api → app1.

