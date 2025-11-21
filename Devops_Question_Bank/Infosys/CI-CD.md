# CI/CD Pipeline – Infosys Interview Questions

## Q1. How do you handle secrets in CI/CD?
### Answer
Use secret variables, Key Vault integration, managed identities, and avoid secrets in repo.
### Follow-Up Points
- Mask secrets  
- Rotate credentials  
### Example
AzureKeyVault@2 to fetch secrets at runtime.

---

## Q2. How do you provision infrastructure? (CI/CD)
### Answer
Use Terraform tasks in Azure DevOps pipeline with remote backend and service connection authentication.
### Follow-Up Points
- Use Terraform plan → approval → apply  
- Separate dev/stage/prod tfvars  
### Example
Terraform CLI task: init → plan → apply.

---

## Q3. Tell me about your CI/CD deployment process.
### Answer
Code commit → PR → Build → Test → Scan → Deploy → Approvals → Release to prod.
### Follow-Up Points
- Use multi-stage pipelines  
- Add quality gates  
### Example
Build stage → Deploy to AKS stage → Validation.

