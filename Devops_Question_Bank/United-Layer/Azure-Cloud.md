# Azure Cloud – United Layer

## Q1. What is VMSS?
### Answer
Scales VM instances automatically.
### Follow-Up Points
- Works with load balancer  
### Example
Autoscale rule CPU > 70%.

---

## Q2. What is Application Gateway?
### Answer
Layer 7 load balancer with routing + WAF.
### Follow-Up Points
- SSL termination  
### Example
Path rule: /app → backend pool.

---

## Q3. What is NSG?
### Answer
Firewall filtering inbound & outbound traffic.
### Follow-Up Points
- Priority-based  
### Example
Allow 80; Deny all.

---

## Q4. How do you secure secrets?
### Answer
Use Key Vault, RBAC, private endpoints, managed identity.
### Follow-Up Points
- No secrets in YAML  
### Example
Key Vault integration with pipeline.

