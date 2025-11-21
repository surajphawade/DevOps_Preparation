# Terraform – Optum

## Q1. How do you manage state file?
### Answer
Use remote backend like Azure Storage with locks & encryption.
### Follow-Up Points
- Enable versioning  
### Example
backend "azurerm" {}

---

## Q2. How do you secure state file?
### Answer
RBAC, private endpoints, encryption at rest, soft delete.
### Follow-Up Points
- Restricted access  
### Example
Storage firewall.

---

## Q3. What is null resource?
### Answer
A resource for running provisioners or triggers without real infra.
### Follow-Up Points
- Useful for scripts  
### Example
null_resource run_script.

---

## Q4. What is data source?
### Answer
Used to fetch existing cloud resource details.
### Follow-Up Points
- Data is read-only  
### Example
data "azurerm_resource_group" "rg".

---

## Q5. What is module?
### Answer
Reusable group of Terraform resources.
### Follow-Up Points
- Helps standardization  
### Example
module "network" { source="./modules/network" }

---

## Q6. What is provider?
### Answer
Plugin that allows Terraform to interact with cloud services.
### Follow-Up Points
- Must run init  
### Example
provider "azurerm".

---

## Q7. What is provisioner?
### Answer
Runs scripts/commands on resources during creation.
### Follow-Up Points
- Should avoid unless necessary  
### Example
remote-exec provisioner.

---

## Q8. Backend in Terraform?
### Answer
Stores state file remotely with locking.
### Follow-Up Points
- Supports remote teams  
### Example
backend "azurerm".

---

## Q9. What is lifecycle rule?
### Answer
Customize resource behavior using ignore_changes, create_before_destroy, prevent_destroy.
### Follow-Up Points
- Avoid downtime  
### Example
lifecycle { ignore_changes = [tags] }

