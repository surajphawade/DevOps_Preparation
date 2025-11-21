# Terraform – TCS

## Q1. How do you provision infra?
### Answer
Write Terraform modules → backend config → run init/plan/apply in Azure DevOps pipeline using service connections.
### Follow-Up Points
- Use tfvars per environment  
- Use remote backend  
### Example
terraform apply -var-file="prod.tfvars"

