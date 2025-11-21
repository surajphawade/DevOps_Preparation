# Terraform – Orion

## Q1. What is Terraform?
### Answer
Infra-as-code tool for automated provisioning.
### Follow-Up Points
- Declarative  
### Example
resource "azurerm_vnet".

---

## Q2. How do you manage Terraform state file?
### Answer
Store in remote backend with locking (Azure Storage).
### Follow-Up Points
- Enable versioning  
### Example
backend "azurerm".

---

## Q3. What is backend in Terraform?
### Answer
Location to store state file remotely.
### Follow-Up Points
- Supports shared teams  
### Example
storage_account_name = "tfstate"

---

## Q4. What is data source?
### Answer
Reads existing cloud resources.
### Follow-Up Points
- Read-only  
### Example
data "azurerm_resource_group".

---

## Q5. What is module?
### Answer
Reusable infra component.
### Follow-Up Points
- Cleaner and DRY code  
### Example
module "network" { source="./modules/network" }

