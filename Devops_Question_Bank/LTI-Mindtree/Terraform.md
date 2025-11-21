# Terraform – LTI Mindtree Interview Questions

## Q1. How do you manage your state file in Terraform?
### Answer
Use a remote backend (Azure Storage, AWS S3, Terraform Cloud) with encryption, versioning, and locking to ensure safe collaboration.
### Follow-Up Points
- Store tfstate remotely, not locally  
- Enable state locking  
- Restrict access with RBAC/IAM  
- Enable soft delete + versioning  
### Example
backend "azurerm" {
  resource_group_name  = "rg"
  storage_account_name = "tfstateacct"
  container_name       = "tfstate"
  key                  = "mindtree.tfstate"
}

---

## Q2. How would you deploy 10 Linux VMs and 10 Windows VMs with Terraform and allow ports 80/443/3389?
### Answer
Use `for_each` or `count` to create multiple VMs, place them in the same VNet/subnet, and create NSGs allowing required ports.
### Follow-Up Points
- Use modules for Windows & Linux separately  
- Use NSG rules for ports (80/443/3389)  
- Use availability sets / zone redundancy if required
### Example
resource "azurerm_linux_virtual_machine" "linux" { count = 10 ... }  
resource "azurerm_windows_virtual_machine" "win" { count = 10 ... }

---

## Q3. State file management in Azure vs AWS — what is the difference?
### Answer
Azure uses Azure Storage with blob-level leases for locking; AWS uses S3 bucket for state and DynamoDB for state locking.
### Follow-Up Points
- Azure → locking built-in  
- AWS → must configure DynamoDB manually  
- Both support encryption + versioning  
### Example
AWS backend: s3 + DynamoDB  
Azure backend: azurerm storage

---

## Q4. Where did you use lifecycle in Terraform?
### Answer
Lifecycle is used for resource behavior such as preventing deletes, ignoring changes, or replacing resources without downtime.
### Follow-Up Points
- `prevent_destroy` for critical resources  
- `ignore_changes` for fields changed by external systems  
- `create_before_destroy` for non-breaking updates  
### Example
lifecycle { ignore_changes = [tags] }

---

## Q5. How do you configure backend?
### Answer
Configure backend inside the `terraform` block and run `terraform init` to migrate or set up state storage.
### Follow-Up Points
- Backend cannot use variables  
- After change → re-init required  
- Protect backend with RBAC/IAM  
### Example
terraform {
  backend "azurerm" { container_name = "state" ... }
}

---

## Q6. How to create Azure DevOps global variables using Terraform?
### Answer
Use Azure DevOps provider (`azuredevops`) to define variable groups and variables.
### Follow-Up Points
- Store secrets securely  
- Use Managed Identity or PAT for provider  
- Link variable group to pipeline  
### Example
resource "azuredevops_variable_group" "vg" {
  name = "global-vars"
  variable { name="env" value="prod" }
}

---

## Q7. Terraform lifecycle from configuration to provisioning.
### Answer
The lifecycle is:  
**Write code → init → validate → plan → apply → manage → destroy**  
Terraform parses configuration, builds dependency graph, plans changes, and applies them.
### Follow-Up Points
- Declarative execution  
- State file tracks current infra  
- Idempotent execution  
### Example
terraform init → terraform plan → terraform apply

---

## Q8. What resources have you provisioned with Terraform?
### Answer
VMs, VNets, NSGs, Load Balancers, Storage Accounts, Key Vault, App Services, AKS clusters, ACR, SQL databases, IAM roles, and monitoring resources.
### Follow-Up Points
- Highlight real project experience  
- Mention module usage  
- Mention automation pipeline integration  
### Example
Terraform → AKS + ACR integration + Private Endpoints + NSGs.

