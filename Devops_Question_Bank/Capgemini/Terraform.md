# Terraform – Capgemini Interview Questions

## Q1. What is a backend in Terraform?
### Answer
A backend is where Terraform stores its state. For teams, remote backend (Azure Storage) is used.
### Follow-Up Points
- Supports team collaboration  
- Enables state locking  
- Prevents corruption  
- Required for remote state
### Example
terraform {
  backend "azurerm" {
    resource_group_name  = "rg"
    storage_account_name = "tfstate123"
    container_name       = "state"
    key                  = "prod.tfstate"
  }
}

---

## Q2. What is a provisioner block and how do you use it in VM?
### Answer
Provisioners run commands/scripts on a VM after creation.
### Follow-Up Points
- Used for one-time setup  
- Installs software  
- Not recommended for long-term use
### Example
provisioner "remote-exec" {
  inline = ["sudo apt update", "sudo apt install nginx -y"]
}

---

## Q3. If you have 10 VM modules how do you provision only 1?
### Answer
Use the `-target` flag during apply.
### Follow-Up Points
- Avoid frequent use  
- Refreshes entire state  
- Only applies targeted resource
### Example
terraform apply -target=module.vm3

---

## Q4. Can we manually modify Terraform state?
### Answer
Yes but not recommended.
### Follow-Up Points
- Always backup first  
- Use terraform state commands instead  
- Use for emergency debug
### Example
terraform state rm azurerm_resource_group.example

---

## Q5. What are variable types in Terraform?
### Answer
String, number, bool, list, map, object.
### Follow-Up Points
- Helps parametrize modules  
- tfvars store values
### Example
variable "names" { type = list(string) }

---

## Q6. How do you pass values into Terraform variables?
### Answer
Using tfvars, CLI, environment variables.
### Follow-Up Points
- terraform.tfvars auto loaded  
- -var-file for custom  
### Example
terraform apply -var-file=dev.tfvars

---

## Q7. Two subscriptions: one has image, one has VM — how manage?
### Answer
Use provider alias.
### Follow-Up Points
- provider "azurerm" { alias="img" }  
- Call specific provider
### Example
provider "azurerm" {
  alias = "sub2"
  subscription_id = "xxxx"
}

---

## Q8. How do you fetch secrets from Key Vault in Terraform?
### Answer
Use azurerm_key_vault_secret data source.
### Follow-Up Points
- SP needs GET permission  
- Secret stays encrypted
### Example
data "azurerm_key_vault_secret" "sqlpass" {
  name = "dbpass"
  key_vault_id = azurerm_key_vault.kv.id
}

---

## Q9. What is null resource?
### Answer
A resource that doesn’t create infra but triggers scripts.
### Follow-Up Points
- Used with triggers  
- Used in CI/CD
### Example
resource "null_resource" "deploy" {
  triggers = { always = timestamp() }
}

---

## Q10. What is a data source in Terraform?
### Answer
Reads existing cloud information.
### Follow-Up Points
- Useful for AMI, RG, KV  
- No resource creation
### Example
data "azurerm_resource_group" "rg" {
  name = "prod-rg"
}

---

## Q11. What is a module?
### Answer
A reusable folder with Terraform resources.
### Follow-Up Points
- DRY principle  
- Standardization
### Example
module "vm" {
  source = "./modules/vm"
  name   = "webvm"
}

---

## Q12. What is a provisioner?
### Answer
Executes commands/scripts.
### Follow-Up Points
- Not idempotent  
- Prefer cloud-init or extensions
### Example
remote-exec / local-exec

---

## Q13. What is terraform taint?
### Answer
Marks resource for recreation.
### Follow-Up Points
- Use when resource breaks  
- Recreates fully
### Example
terraform taint azurerm_virtual_machine.vm

---

## Q14. What happens if storage account created with Terraform is in use & you modify it?
### Answer
It may recreate or fail.
### Follow-Up Points
- Use lifecycle ignore_changes  
- Coordinate with team
### Example
lifecycle { ignore_changes = [tags] }

---

## Q15. Write syntax for Azure Storage Account.
### Answer
Basic storage account resource.
### Follow-Up Points
- Name must be unique  
- LRS recommended for dev
### Example
resource "azurerm_storage_account" "sa" {
  name = "mystorage123"
  resource_group_name = "rg"
  location = "eastus"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

---

## Q16. What is a backend & why used?
### Answer
To store terraform state centrally.
### Follow-Up Points
- Enables collaboration  
- State locking
### Example
backend "azurerm" {}

---

## Q17. If npq.tfvars renamed, will Terraform run it?
### Answer
No, unless you pass it manually.
### Follow-Up Points
- terraform.tfvars auto-loads  
- custom names need -var-file
### Example
terraform apply -var-file=new.tfvars

---

## Q18. If subnet has 16 IPs, how many are usable?
### Answer
Azure reserves 5 → 16 - 5 = 11 usable.
### Follow-Up Points
- network  
- broadcast  
- three reserved
### Example
/28 subnet = 16 IPs

---

## Q19. Which CIDR for 1000 IPs?
### Answer
/22 (1024 IPs)
### Follow-Up Points
- /24 = 256  
- /23 = 512  
- /22 = 1024
### Example
N/A

---

## Q20. CIDR calculation formula?
### Answer
IPs = 2^(32-prefix)
### Follow-Up Points
- /24 = 256  
- /28 = 16  
- /30 = 4
### Example
32 - 24 = 8 → 2^8 = 256

