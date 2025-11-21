# Terraform – Publicis Sapient Interview Questions

## Q1. Where do you store your state file?
### Answer
Store state in a remote backend like Azure Storage, AWS S3, or Terraform Cloud.
### Follow-Up Points
- Enable encryption  
- Turn on soft delete + versioning  
### Example
backend "azurerm" { container_name="tfstate" }

---

## Q2. What is the lifecycle in Terraform?
### Answer
Lifecycle controls resource behavior using arguments like create_before_destroy, prevent_destroy, and ignore_changes.
### Follow-Up Points
- Avoid downtime  
- Protect against accidental deletes  
### Example
lifecycle { prevent_destroy = true }

---

## Q3. Pipeline failed after apply and got stuck in lock state — how do you resolve?
### Answer
Manually remove the lock from backend (Azure Storage lease or DynamoDB entry).
### Follow-Up Points
- Ensure no other apply is running  
- Use force-unlock as last option  
### Example
terraform force-unlock <lock-id>

---

## Q4. If calling variables from Key Vault but don’t want to mention them in pipeline or code?
### Answer
Use Managed Identity + Key Vault references to fetch secrets at runtime.
### Follow-Up Points
- Avoid plain-text variables  
- Use EnableSoftDelete for KV  
### Example
Terraform → MSI → Key Vault → Secret.

