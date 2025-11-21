# Security / Secrets – LTI Mindtree Interview Questions

## Q1. How do you store secrets in pipeline?
### Answer
Store secrets in secure variable groups, Key Vault integration, or pipeline secret variables.
### Follow-Up Points
- Never store secrets in YAML  
- Use Key Vault tasks for retrieval  
- RBAC controls access  
### Example
variables:
- name: dbpass
  value: $(db-password)

---

## Q2. How do you manage secrets in Azure DevOps?
### Answer
Use variable groups, Key Vault references, secure files, and service connections with restricted permissions.
### Follow-Up Points
- Enable secret=true  
- Use Managed Identity or SP  
- Limit variable read permissions  
### Example
Library → Variable Group → Link to pipeline.

---

## Q3. How do you secure Terraform state file?
### Answer
Store in encrypted remote backend + RBAC + versioning + soft delete + not storing sensitive values in code.
### Follow-Up Points
- Use Key Vault for secrets  
- Private endpoints for storage  
- Separate state per environment  
### Example
Azure Storage + access policy + private endpoint.

---

## Q4. Where do you store secrets in CI/CD?
### Answer
Inside Azure Key Vault, variable groups, GitHub encrypted secrets, or Vault-based secret stores.
### Follow-Up Points
- Do not store secrets in repo  
- Use OIDC for GitHub  
- Rotate secrets periodically  
### Example
System-assigned identity → Get secret from Key Vault.

