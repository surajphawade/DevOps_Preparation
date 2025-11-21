# Azure Cloud – Optum

## Q1. What is Azure Function?
### Answer
Serverless compute service triggered by events; runs small pieces of code without managing servers.
### Follow-Up Points
- Pay per execution  
- Event-driven architecture  
### Example
HTTP-triggered function for API automation.

---

## Q2. What is Azure App Service?
### Answer
PaaS service to deploy web apps, APIs, and backend services.
### Follow-Up Points
- Supports deployment slots  
- Autoscaling  
### Example
Deploy .NET app using CI/CD.

---

## Q3. How do you securely access resources?
### Answer
Private endpoints, NSG rules, RBAC, Managed Identity, Firewalls, VNet integration.
### Follow-Up Points
- Disable public access  
### Example
Key Vault → private endpoint.

---

## Q4. How do you store secrets in Azure?
### Answer
Azure Key Vault with RBAC access + versioning + private endpoint.
### Follow-Up Points
- Never store secrets in code  
### Example
App → Managed Identity → Key Vault.

---

## Q5. What is Application Gateway?
### Answer
Layer-7 load balancer with WAF support.
### Follow-Up Points
- SSL termination  
- Path routing  
### Example
/api → backend pool 1.

---

## Q6. What is NSG and priority?
### Answer
NSG filters traffic; priority decides evaluation order (lower = higher precedence).
### Follow-Up Points
- Range: 100–4096  
### Example
Priority 100 deny overrides allow 200.

---

## Q7. What are service endpoints?
### Answer
Extend VNet identity to Azure services over Microsoft backbone.
### Follow-Up Points
- Does not give private IP  
### Example
Service endpoint → Storage.

---

## Q8. What are private endpoints?
### Answer
Private IP assigned to Azure service inside VNet.
### Follow-Up Points
- Most secure access method  
### Example
Key Vault private endpoint.

