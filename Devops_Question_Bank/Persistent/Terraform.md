# Terraform – Persistent Systems Interview Questions

## Q1. How do you manage the state in Terraform when working in a team environment?
### Answer
Store state remotely (Azure Storage, S3, or Terraform Cloud) and enable state locking so multiple users can't write simultaneously.
### Follow-Up Points
- Use a remote backend (azurerm, s3, remote)  
- Enable locking (DynamoDB for AWS S3 backend, or built-in locking in Terraform Cloud)  
- Use workspaces or separate state per environment  
- Secure state with encryption and limited access
### Example
terraform {
  backend "azurerm" {
    resource_group_name  = "rg"
    storage_account_name = "tfstateacct"
    container_name       = "tfstate"
    key                  = "persistent.tfstate"
  }
}

---

## Q2. What is a state file in Terraform?
### Answer
A state file (terraform.tfstate) records the current mapping between resources in your configuration and real-world resources.
### Follow-Up Points
- Contains resource IDs and metadata  
- Used for planning and diffing changes  
- Sensitive data can be in state — treat securely
### Example
Use `terraform show` to inspect state and `terraform state list` to view resources.

---

## Q3. When does the state file appear?
### Answer
The state file is created after `terraform apply` (or `terraform init` with an existing remote backend may fetch it).
### Follow-Up Points
- `terraform plan` reads state to compute changes  
- Local state created in working directory if no remote backend configured
### Example
Run `terraform apply` → terraform.tfstate created/updated.

---

## Q4. What is state locking in Terraform?
### Answer
A mechanism to prevent concurrent operations from corrupting state by acquiring a lock while applying changes.
### Follow-Up Points
- Backend-specific: DynamoDB for S3, Azure Storage supports leases, Terraform Cloud locks automatically  
- Prevents race conditions and partial updates
### Example
S3 backend with DynamoDB table used for locks in AWS architectures.

---

## Q5. Suppose you are keeping your state file locally and it gets deleted — how will you recover?
### Answer
If you have backups (VCS, a CI artifact, or manual backup), restore the tfstate file; otherwise run `terraform import` to reimport resources or recreate state by manual imports.
### Follow-Up Points
- Always back up state or use remote backend to avoid this risk  
- Use `terraform import` to reattach resources to state  
- Consider enabling versioning on remote storage
### Example
terraform import azurerm_resource_group.rg /subscriptions/xxx/resourceGroups/my-rg

---

## Q6. What is drift situation?
### Answer
Drift is when real-world infrastructure changes outside of Terraform, causing the state to diverge from actual resources.
### Follow-Up Points
- Detect drift with `terraform plan` or `terraform refresh`  
- Fix by reconciling changes manually or updating code to match reality  
- Prevent drift using automation and controlled changes through IaC
### Example
Run `terraform plan` and it will show differences if resources were changed manually.

---

## Q7. If you have one resource available in cloud but not in tfstate, what happens?
### Answer
Terraform will attempt to create that resource if your configuration includes it (causing conflict or duplication) unless you import the existing resource into state first.
### Follow-Up Points
- Use `terraform import` to add the resource to state  
- Inspect resource IDs to avoid accidental recreation
### Example
terraform import azurerm_storage_account.sa /subscriptions/.../resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/sa

---

## Q8. What is terraform init?
### Answer
`terraform init` initializes a working directory: it downloads providers, initializes backend, and prepares modules.
### Follow-Up Points
- Run after cloning a repo or changing backend/provider configuration  
- Safe to run multiple times
### Example
terraform init -backend-config="key=env.tfstate"

---

## Q9. What is the difference between terraform plan and terraform apply?
### Answer
`terraform plan` shows the planned changes without making them; `terraform apply` executes those changes to reach the desired state.
### Follow-Up Points
- Use plan for review/approval in pipelines  
- `apply` can accept a saved plan file for safer execution
### Example
terraform plan -out=plan.tfplan
terraform apply plan.tfplan

---

## Q10. Explain all mandatory Terraform commands and how you use them in ADO.
### Answer
Core commands: `init`, `plan`, `apply`, `destroy`, `fmt`, `validate`, `taint`/`untaint`, `import`, `state`. In ADO pipelines you run init → plan (save artifact) → apply (approved or automated) with secure service connection.
### Follow-Up Points
- Use `terraform fmt` and `validate` in CI pre-checks  
- Store plan artifacts for review and gated apply  
- Use service principals or managed identities for auth
### Example
Pipeline steps: terraform init → terraform plan -out=plan.tfplan → publish plan → manual approval → terraform apply plan.tfplan

---

## Q11. Terraform show?
### Answer
`terraform show` displays human-readable or JSON-formatted state or plan content.
### Follow-Up Points
- Useful to inspect a plan file or state snapshot  
- Can convert plan to readable output for auditors
### Example
terraform show -json plan.tfplan | jq '.'

---

## Q12. Terraform fmt?
### Answer
`terraform fmt` formats Terraform code to canonical style; used to enforce consistency.
### Follow-Up Points
- Run in CI to fail PRs with bad formatting  
- Supports auto-fixing files
### Example
terraform fmt -recursive

---

## Q13. Types of Terraform provisioners and how they work?
### Answer
Main provisioners: `local-exec` (runs on machine running Terraform) and `remote-exec` (runs commands on remote machine). There are also file provisioners to upload files.
### Follow-Up Points
- Provisioners are for last-resort tasks; prefer cloud-init or configuration management tools  
- Not idempotent by design
### Example
provisioner "remote-exec" { inline = ["sudo apt-get update"] }

---

## Q14. What is a provider?
### Answer
A provider is a plugin that Terraform uses to interact with cloud APIs (Azure, AWS, etc.) and create/manage resources.
### Follow-Up Points
- Providers must be configured (credentials, region, subscription)  
- Provider versions should be pinned for stability
### Example
provider "azurerm" { features = {} }

---

## Q15. What is a null resource?
### Answer
`null_resource` is a resource that performs no infrastructure action but can host provisioners and triggers.
### Follow-Up Points
- Useful for orchestration or running scripts conditioned on triggers  
- Not creating cloud resources itself
### Example
resource "null_resource" "run" { triggers = { timestamp = timestamp() } }

---

## Q16. What is a Terraform module?
### Answer
A module is a container for multiple resources that are used together; modules enable reuse and encapsulation.
### Follow-Up Points
- Use modules for standard patterns (network, compute, AKS)  
- Publish internal modules to a registry or keep them in repo
### Example
module "aks" { source = "./modules/aks" name = "prod-aks" }

---

## Q17. What is Terraform provider? 
### Answer
(Repeat for emphasis) A provider is the bridge between Terraform and the target API (cloud or service) enabling resource management.
### Follow-Up Points
- Manage provider configuration and credentials centrally  
- Lock provider versions with required_providers
### Example
terraform { required_providers { azurerm = { source = "hashicorp/azurerm", version = "~>3.0" } } }

---

## Q18. What is terraform.tfvars?
### Answer
`terraform.tfvars` is a file used to set variable values automatically when Terraform runs.
### Follow-Up Points
- Sensitive values should not be stored in plaintext tfvars in VCS  
- Use separate tfvars per environment (dev.tfvars, prod.tfvars)
### Example
# terraform.tfvars
env = "dev"
vm_count = 2

---

## Q19. What is difference between variable.tf and variables.tfvars?
### Answer
`variables.tf` (or variable.tf) declares variables and types; `*.tfvars` files provide concrete values for those variables.
### Follow-Up Points
- Declarations vs values separation keeps code clean  
- Use tfvars for environment-specific settings
### Example
variables.tf -> variable "vm_count" { type = number }
dev.tfvars -> vm_count = 2

---

## Q20. What argument is used to provide default value in variable?
### Answer
Use the `default` argument inside the variable block to give a default value.
### Follow-Up Points
- Defaults make variables optional  
- Avoid using defaults for sensitive values
### Example
variable "location" { type = string default = "eastus" }

---

## Q21. What is meta-arguments & how do they work? Provide example.
### Answer
Meta-arguments like `count`, `for_each`, `depends_on`, and `lifecycle` alter resource behavior without being resource attributes.
### Follow-Up Points
- `count` and `for_each` for multiple instances  
- `depends_on` enforces ordering  
- `lifecycle` controls create/replace behavior
### Example
resource "azurerm_vm" "vm" { count = var.count ... lifecycle { prevent_destroy = true } }

---

## Q22. What are lifecycle rules in Terraform?
### Answer
`lifecycle` block allows controlling resource creation, update, and deletion behavior: `create_before_destroy`, `prevent_destroy`, `ignore_changes`.
### Follow-Up Points
- `create_before_destroy` for zero-downtime replacements  
- `ignore_changes` useful for fields managed outside TF
### Example
lifecycle { create_before_destroy = true ignore_changes = [tags] }

---

## Q23. How do you fetch existing resource details with Terraform? (data block)
### Answer
Use `data` blocks (data sources) to read existing resources which you don't want to manage with Terraform.
### Follow-Up Points
- Common with AMIs, existing VNETs, Key Vault secrets  
- Data sources do not create resources
### Example
data "azurerm_resource_group" "rg" { name = "existing-rg" }

---

## Q24. What is implicit & explicit dependency?
### Answer
Implicit dependencies are inferred from references between resources; explicit dependencies use `depends_on` to force ordering.
### Follow-Up Points
- Prefer implicit dependencies where possible  
- Use `depends_on` when Terraform can't infer order
### Example
resource "azurerm_public_ip" "pip" {}
resource "azurerm_lb" "lb" { depends_on = [azurerm_public_ip.pip] }

---

## Q25. Terraform workspace and why we use it.
### Answer
Workspaces allow multiple distinct states from the same configuration (commonly used for dev/stage/prod separation).
### Follow-Up Points
- Use with caution — may be less clear than separate state/backends per env  
- Good for small differences across environments
### Example
terraform workspace new dev
terraform workspace select prod

---

## Q26. How do you use Terraform to provision AKS and connect it to ACR?
### Answer
Create AKS cluster resource and grant it pull permissions to ACR via role assignment or use `admin_enabled` on ACR or attach ACR as `acr_pull` role to AKS kubelet identity.
### Follow-Up Points
- Use Managed Identities for secure auth  
- Use role assignment azurerm_role_assignment for the AKS identity on ACR  
- Consider using Azure AD integration and ACR managed identities
### Example
resource "azurerm_kubernetes_cluster" "aks" { ... }
resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

---

## Q27. You have dev/stage/prod infra — how will you deploy them via Terraform and secure them?
### Answer
Use separate state files/backends or workspaces per environment, dedicated variable tfvars per env, enforce role-based access to backends, and use CI pipeline with approvals for prod.
### Follow-Up Points
- Separate backend container/key for each env or prefix keys (dev.tfstate, prod.tfstate)  
- Use Service Principals with least privilege per env  
- Use OIDC or secret management to avoid storing credentials in pipeline  
- Protect prod with manual approval gates and limited approvers
### Example
terraform apply -var-file=prod.tfvars -target=module.app   (with pipeline approval)

