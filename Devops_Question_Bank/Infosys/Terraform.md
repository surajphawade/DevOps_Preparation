# Terraform – Infosys Interview Questions

## Q1. How do you provision infrastructure?
### Answer
Write Terraform configuration → init → plan → apply using CI/CD pipeline with remote backend.
### Follow-Up Points
- Use modules  
- Separate state per environment  
### Example
terraform apply -var-file="prod.tfvars"

---

## Q2. Tell me key features of Terraform?
### Answer
Declarative, idempotent, multi-cloud, uses state, modular, and supports dependency graph.
### Follow-Up Points
- Plan → predicts changes  
- Provider ecosystem  
### Example
Provision AKS, ACR, VNet in one config.

---

## Q3. Tell me difference between init, plan, apply?
### Answer
init → setup provider/plugins  
plan → preview changes  
apply → execute changes  
### Follow-Up Points
- Apply is irreversible  
- Plan is safe and read-only  
### Example
terraform init → terraform plan → terraform apply

---

## Q4. Why do we use Terraform? Benefits?
### Answer
Automates infra creation, ensures consistency, supports versioning, avoids manual errors, and is reusable through modules.
### Follow-Up Points
- Infra as code  
- Environment standardization  
### Example
Same module → dev, stage, prod.

