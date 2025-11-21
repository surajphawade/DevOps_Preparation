# Storage Account Scenario – TechRBM Interview Questions

## Q1. If a storage account was created through Terraform and teams started using it and stored files, and now you need to modify it — what will happen?
### Answer
Terraform will plan the changes and, depending on what is modified, may update the storage account in-place or attempt to recreate it. If recreation occurs, existing data could be impacted. To prevent disruption, use `lifecycle { ignore_changes = [...] }`, or plan a migration strategy, or perform non-destructive changes. Always coordinate with consumers and back up data before applying destructive changes.
### Follow-Up Points
- Use `terraform plan` to inspect changes.  
- Use `ignore_changes` for fields changed outside TF.  
- Avoid renaming or changing properties that force replacement.
### Example
resource "azurerm_storage_account" "sa" { lifecycle { ignore_changes = [tags] } }

