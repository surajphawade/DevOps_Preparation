# Terraform – Cognizant (CTS)

## Q1. Write Terraform code for any resource.
### Answer
Typical example: storage account, VM, VNet, AKS, ACR.
### Follow-Up Points
- Use modules  
### Example
resource "azurerm_storage_account" "st" { name="ctsstore" ... }

---

## Q2. Terraform commands.
### Answer
init → download providers  
plan → preview  
apply → execute  
destroy → cleanup  
fmt/validate → formatting & syntax check.
### Follow-Up Points
- Use backend  
- Use var files  
### Example
terraform plan -var-file="prod.tfvars"

---

## Q3. Explain module structure.
### Answer
Modules contain main.tf, variables.tf, outputs.tf and optional submodules.
### Follow-Up Points
- Use for reusable infra  
### Example
module "network" { source="./modules/network" }

---

## Q4. How do you connect Terraform project to Azure DevOps?
### Answer
Store code in Azure Repos → Use Terraform tasks in pipeline → Service connection → Remote backend in Azure Storage.
### Follow-Up Points
- Use var groups  
- Use multiple environments  
### Example
Terraform CLI task: init → plan → apply.

