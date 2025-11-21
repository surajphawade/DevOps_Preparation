# Security & Secrets – Persistent Systems Interview Questions

## Q1. How do you manage credentials in Kubernetes?
### Answer
Use Kubernetes Secrets encoded in base64 and access them via env variables or mounted volumes.
### Follow-Up Points
- Use external secret stores (AWS SM, Azure Key Vault)  
- Enable RBAC restrictions  
- Avoid committing secrets to Git
### Example
env:
- name: DB_PASS  
  valueFrom:  
    secretKeyRef: { name: dbsecret, key: password }

---

## Q2. How do you secure the TF state file?
### Answer
Use remote backend with encryption, restricted access, versioning, and lock enforcement.
### Follow-Up Points
- Azure Storage with SSE encryption  
- Enable soft-delete  
- Restrict access via RBAC
### Example
Terraform Cloud stores encrypted state with RBAC + audit logs.

---

## Q3. How do you secure secrets in Azure & AWS?
### Answer
Azure: Key Vault  
AWS: Secrets Manager & KMS  
Use IAM/MIS/RBAC to allow least privilege access.
### Follow-Up Points
- Never store secrets in code  
- Use managed identities  
- Enable audit logs and rotation
### Example
AWS: aws secretsmanager get-secret-value  
Azure: az keyvault secret show

---

## Q4. How do you stop developers from pushing insecure code? (Pipeline policies)
### Answer
Enable static code analysis, dependency scanning, secret scanning, linting, and policy checks in CI/CD pipeline.
### Follow-Up Points
- Use SonarQube, Checkov, Trivy  
- Block merges when scan fails  
- Use branch protection rules
### Example
Pipeline step: run SAST → fail pipeline if severity = high.

