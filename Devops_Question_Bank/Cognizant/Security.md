# Security & Secrets – Cognizant (CTS)

## Q1. Junior commits client secret — how do you manage it?
### Answer
Remove secret from repo, rotate the secret, use scanning tools, enforce pre-commit validation.
### Follow-Up Points
- Use Git history rewrite if required  
- Add PR checks for secrets  
### Example
Use GitGuardian/SonarQube for secret scanning.

---

## Q2. Where do you manage SSL certificates?
### Answer
Azure Key Vault, App Gateway, and Azure App Service certificate store.
### Follow-Up Points
- Auto-rotation  
- RBAC-secured  
### Example
Import PFX into Key Vault and bind to App Gateway.

---

## Q3. Where do you keep secrets in Azure DevOps?
### Answer
In variable groups, secret variables, Key Vault references.
### Follow-Up Points
- Masking enabled  
- Limit permissions  
### Example
AzureKeyVault@2 → fetch secret during pipeline.

