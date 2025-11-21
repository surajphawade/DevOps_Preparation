# Terraform – TechRBM Interview Questions

## Q1. What is null_resource?
### Answer
`null_resource` is a Terraform resource that does not manage any external infrastructure but provides a place to attach provisioners and triggers.
### Follow-Up Points
- Good for orchestration tasks or running scripts.  
- Use triggers to force re-run when inputs change.
### Example
resource "null_resource" "run" { triggers = { always = timestamp() } }

---

## Q2. What is data source?
### Answer
A `data` source reads data from existing resources (cloud provider or other sources) without creating them.
### Follow-Up Points
- Useful to look up AMIs, RGs, existing VNETs, Key Vault secrets.  
- Read-only operation during plan/apply.
### Example
data "azurerm_resource_group" "rg" { name = "prod-rg" }

---

## Q3. What is module?
### Answer
A module is a set of Terraform configuration files grouped as a reusable component. Root module is the current directory, child modules are referenced via `module` blocks.
### Follow-Up Points
- Promote reuse and standardization.  
- Version or pin modules for stability.
### Example
module "vnet" { source = "./modules/vnet" name = "prod" }

---

## Q4. What is provisioner?
### Answer
Provisioners run scripts or commands on local or remote machines (`local-exec`, `remote-exec`, `file`). They are for bootstrapping/configuration but not ideal for long-term config management.
### Follow-Up Points
- Prefer cloud-init/extensions or config management (Ansible) over provisioners.  
- Not idempotent by default.
### Example
provisioner "remote-exec" { inline = ["sudo apt-get update"] }

---

## Q5. What is taint?
### Answer
`terraform taint` marks a resource for recreation on the next `apply`. Useful when a resource is known to be in a broken state.
### Follow-Up Points
- After taint → apply will recreate the resource.  
- Use sparingly and prefer targeted remediation.
### Example
terraform taint azurerm_virtual_machine.vm

