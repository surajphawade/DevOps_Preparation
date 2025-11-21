# Security / Secrets – CGI

## Q1. How do you secure application secrets?
### Answer
Use Key Vault, secret variables, RBAC, encryption, and avoid storing secrets in code.
### Follow-Up Points
- Use private endpoints  
### Example
ADO → Key Vault reference.

---

## Q2. Where do you store secrets?
### Answer
Azure Key Vault or CI/CD secret variables.
### Follow-Up Points
- Rotate keys regularly  
### Example
KV secret reference in pipeline.

