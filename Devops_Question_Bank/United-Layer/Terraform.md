# Terraform – United Layer

## Q1. What is Terraform?
### Answer
Infra-as-Code tool for declarative provisioning.
### Follow-Up Points
- Platform agnostic  
### Example
resource "azurerm_vnet".

---

## Q2. Why Terraform over ARM?
### Answer
Reusable modules, version control, multiplatform support, cleaner code.
### Follow-Up Points
- ARM = verbose  
### Example
Terraform modules reduce duplication.

---

## Q3. What is Terraform state file?
### Answer
Stores current infra state.
### Follow-Up Points
- Sensitive → secure it  
### Example
terraform.tfstate.

---

## Q4. How to secure Terraform state file?
### Answer
Remote backend, encryption, RBAC, soft delete, private endpoints.
### Follow-Up Points
- Azure Storage backend  
### Example
backend "azurerm".

---

## Q5. What is module?
### Answer
Reusable infra component folder.
### Follow-Up Points
- DRY code  
### Example
module "network" { source="./modules/network" }

---

## Q6. What is data source?
### Answer
Reads existing resources.
### Follow-Up Points
- Read-only  
### Example
data "azurerm_resource_group".

---

## Q7. What is null resource?
### Answer
Runs provisioners without creating infra.
### Follow-Up Points
- Helpful for scripts  
### Example
triggers = { always = timestamp() }

---

## Q8. What is backend?
### Answer
Location where state file is stored.
### Follow-Up Points
- Used for collaboration  
### Example
Azure Storage backend.

---

## Q9. How do you deploy infra using CI/CD?
### Answer
Pipeline → init → validate → plan → apply → approval → destroy.
### Follow-Up Points
- Use service connection  
### Example
Terraform tasks in Azure DevOps.

