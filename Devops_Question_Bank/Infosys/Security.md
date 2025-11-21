# Security / Secrets – Infosys Interview Questions

## Q1. How do you handle secrets in CI/CD?
### Answer
Use Key Vault, secret variables, masked logs, and service connections. Never store secrets in repo.
### Follow-Up Points
- Use RBAC  
- Rotate regularly  
### Example
AzureKeyVault@2 → fetch at runtime.

