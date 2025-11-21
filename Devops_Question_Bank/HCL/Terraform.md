# Terraform – HCL Interview Questions

## Q1. What do you mean by state file in Terraform supported location to store state?
### Answer
The Terraform state file (terraform.tfstate) maps your configuration to real resources and stores metadata. Supported remote locations include Azure Storage, AWS S3 (with optional DynamoDB locking), Google Cloud Storage, and Terraform Cloud/Enterprise.
### Follow-Up Points
- Use remote backends for team collaboration.  
- Enable locking to prevent concurrent writes.  
- Ensure encryption and access control on backend storage.
### Example
backend "azurerm" { resource_group_name="rg" storage_account_name="st" container_name="tfstate" key="hcl.tfstate" }

---

## Q2. When is the state file created?
### Answer
A state file is created or updated after `terraform apply`. If using a remote backend, `terraform init` may fetch an existing state.
### Follow-Up Points
- `terraform plan` reads the state to compute diffs.  
- Local state appears in working directory if no remote backend configured.
### Example
Run `terraform apply` → terraform.tfstate created/updated.

---

## Q3. You created a variable and marked it sensitive — what is the impact on the state file? Encrypted or plain?
### Answer
Marking a variable `sensitive = true` prevents it from being shown in CLI output and logs. It does not automatically encrypt values in the state file; sensitive values may still be present in state unless the backend encrypts at rest.
### Follow-Up Points
- Use encrypted remote backend and restrict access.  
- Avoid storing secrets in plain tfvars files; use Key Vault/Secrets Manager.  
- Sensitive hides output in plan/apply logs but not necessarily in the state.
### Example
variable "db_password" { type = string sensitive = true }

---

## Q4. You didn’t provide a default value. Will that value be part of the state file?
### Answer
If you do not provide a value for a variable and the variable is required at apply time, Terraform will require you to pass it. If the variable is used to create resources, the resulting resource attributes will be stored in state; the variable default itself is not a state entry.
### Follow-Up Points
- tfvars or -var-file provides values at runtime.  
- Use defaults sparingly for non-sensitive values.
### Example
variable "vm_count" { type = number }  # must provide via tfvars or -var

---

## Q5. What are backends you are familiar with?
### Answer
Common backends: azurerm (Azure Storage), s3 (AWS S3 + DynamoDB locking), gcs (Google Cloud Storage), remote (Terraform Cloud/Enterprise), local (local file).
### Follow-Up Points
- Choose backend based on cloud provider and org policy.  
- Some backends provide built-in locking (Terraform Cloud); others require additional services (DynamoDB).
### Example
terraform { backend "s3" { bucket = "tfstate-bucket" key = "hcl/terraform.tfstate" region = "us-east-1" } }

---

## Q6. How do you encrypt the state file?
### Answer
Enable server-side encryption on the storage backend (e.g., Azure Storage SSE, S3 SSE-KMS), and use Terraform Cloud which stores state encrypted. Also secure access with IAM/RBAC.
### Follow-Up Points
- Enable encryption at rest and in transit.  
- Limit access with IAM roles and network rules.  
- Enable versioning and soft-delete where available.
### Example
S3 with SSE-KMS + DynamoDB for locking.

---

## Q7. What is state file and where can we store it?
### Answer
State file stores resource mappings and metadata. Store it locally for single-user, or remotely in Azure Storage, AWS S3, GCS, Terraform Cloud, or HashiCorp Consul for teams.
### Follow-Up Points
- Remote backends recommended for teams.  
- Use backend-specific locking and versioning.
### Example
backend "remote" { hostname = "app.terraform.io" organization = "org" workspaces { name = "hcl" } }

---

## Q8. What is lock file and why is it created?
### Answer
A lock is a mechanism to prevent concurrent writes to state during operations. Some backends create a lock entry (e.g., DynamoDB row for S3, lease for Azure Storage) to ensure only one operation modifies state at a time.
### Follow-Up Points
- Locks prevent race conditions and partial updates.  
- Some backends auto-release locks on completion; manual release may be needed after failures.
### Example
DynamoDB table used by S3 backend for locking.

---

## Q9. What is state locking in Terraform?
### Answer
State locking is acquiring an exclusive lock on the remote state while running commands that modify state, preventing concurrent operations that could corrupt the state.
### Follow-Up Points
- Implement via backend (DynamoDB for S3, Azure Blob leases, Terraform Cloud built-in).  
- Always check for stale locks if operations fail.
### Example
terraform apply acquires and releases locks automatically for supported backends.

---

## Q10. After which command will state file be created?
### Answer
`terraform apply` creates or updates the state. `terraform plan` reads the state but doesn't create/modify it. `terraform init` may fetch an existing remote state.
### Follow-Up Points
- `terraform refresh` updates state from real resources (older versions used this).  
- Use `plan -out` and `apply` to ensure changes match planned output.
### Example
terraform apply -auto-approve

---

## Q11. What is terraform show?
### Answer
`terraform show` displays the contents of a state or plan file in human-readable form or JSON when using `-json`.
### Follow-Up Points
- Useful to inspect saved plan files or to debug state.  
- Can be piped through jq when using JSON output.
### Example
terraform show -json plan.tfplan | jq '.'

---

## Q12. What is terraform fmt?
### Answer
`terraform fmt` formats Terraform code to canonical style and layout, ensuring consistency across the codebase.
### Follow-Up Points
- Run in CI to enforce formatting.  
- Supports `-recursive` for entire directories.
### Example
terraform fmt -recursive

---

## Q13. What are the data types you are familiar with in Terraform?
### Answer
Primitive types: string, number, bool. Complex types: list, map, set, object, tuple. You can also use nested types and type constraints.
### Follow-Up Points
- Use type constraints to validate inputs.  
- Leverage object types for structured variables.
### Example
variable "tags" { type = map(string) }

---

## Q14. You are creating variable in Terraform and need to provide default value — which argument will you declare?
### Answer
Use the `default = <value>` argument inside the variable block.
### Follow-Up Points
- Defaults make variables optional.  
- Avoid defaults for sensitive or environment-specific values.
### Example
variable "location" { type = string default = "eastus" }

---

## Q15. You provided type as integer — create variable that accepts only 0 to 10, 11 should not be accepted. How? (custom validation)
### Answer
Use the `validation` block with a condition expression to restrict values.
### Follow-Up Points
- Use custom messages for clarity.  
- Validation runs during `terraform validate` and plan/apply time.
### Example
variable "num" {
  type = number
  validation {
    condition     = var.num >= 0 && var.num <= 10
    error_message = "num must be between 0 and 10"
  }
}

---

## Q16. What is type constraint in Terraform?
### Answer
Type constraints specify allowed types for variables (string, number, object, etc.), preventing wrong inputs at runtime and enabling better validation.
### Follow-Up Points
- Use `any` for flexible variables, but prefer explicit types.  
- Structuring types helps with editor validation and maintainability.
### Example
variable "config" { type = object({ name = string, replicas = number }) }

---

## Q17. What is the syntax of custom validation?
### Answer
Inside a `variable` block, use a `validation` block with `condition` expression and `error_message`.
### Follow-Up Points
- The condition is an expression returning true/false.  
- Helpful to capture business rules early.
### Example
variable "env" {
  type = string
  validation {
    condition     = contains(["dev","stage","prod"], var.env)
    error_message = "env must be one of dev, stage, prod"
  }
}

---

## Q18. What is variable.tf and terraform.tfvars? What’s the difference?
### Answer
`variable.tf` (or variables.tf) declares variables and their types/defaults; `terraform.tfvars` contains concrete values for those variables and is automatically loaded by Terraform.
### Follow-Up Points
- Keep declarations separate from environment values.  
- Avoid committing sensitive tfvars; use secret stores.
### Example
variables.tf: variable "vm_count" { type = number }  
terraform.tfvars: vm_count = 3

---

## Q19. What is module?
### Answer
A module is a reusable container of Terraform configuration (one or more .tf files). The root module is the working directory; child modules are referenced via `module` blocks.
### Follow-Up Points
- Use modules to standardize patterns (network, compute, aks).  
- Publish reusable modules to a registry or internal repo.
### Example
module "vnet" { source = "./modules/vnet" name = "prod-vnet" }

---

## Q20. What is providers and write code?
### Answer
Providers are plugins that interact with APIs (cloud or service). You configure a provider block to specify credentials, region, and other settings.
### Follow-Up Points
- Pin provider versions for reproducibility.  
- Multiple providers (aliases) can manage resources across subscriptions/accounts.
### Example
provider "azurerm" { features = {} }

---

## Q21. Types of provisioners in Terraform.
### Answer
Main provisioners: `local-exec`, `remote-exec`, and `file`. These run commands locally or on remote resources, or transfer files.
### Follow-Up Points
- Provisioners are a last-resort; prefer cloud-init or configuration management.  
- They are not inherently idempotent.
### Example
provisioner "local-exec" { command = "echo Hello" }

---

## Q22. What is file provisioner?
### Answer
`file` provisioner copies files or directories from the machine running Terraform to the remote resource.
### Follow-Up Points
- Requires connectivity (SSH/WinRM) to target.  
- Often used with `remote-exec`.
### Example
provisioner "file" { source = "script.sh" destination = "/tmp/script.sh" }

---

## Q23. What is null resource?
### Answer
`null_resource` is a Terraform resource that does not manage external infrastructure but can run provisioners and use triggers for orchestration.
### Follow-Up Points
- Useful for running scripts conditionally.  
- Can be used to create dependencies or one-off actions.
### Example
resource "null_resource" "run_once" { triggers = { run = timestamp() } }

---

## Q24. What is data variable?
### Answer
Likely referring to data sources: data blocks read information about existing resources without creating them. Variables hold user inputs; data sources fetch existing resources.
### Follow-Up Points
- Data sources are read-only and do not change infra.  
- Useful for referencing existing IDs, images, or values.
### Example
data "azurerm_resource_group" "rg" { name = "existing-rg" }

---

## Q25. What is data block in Terraform?
### Answer
A `data` block defines a data source to fetch information about existing infrastructure that Terraform can read and use in configuration.
### Follow-Up Points
- Commonly used for AMIs, images, existing resource IDs, secrets.  
- Data blocks do not create resources.
### Example
data "aws_ami" "ubuntu" { most_recent = true owners = ["099720109477"] filters = [{ name = "name", values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] }] }

---

## Q26. If you create a data block, will it be part of state file?
### Answer
No — data sources are read-only and not stored as managed resources in the state; they are fetched during plan/apply and not tracked as resources in the state.
### Follow-Up Points
- Data outputs are used during runs but not persisted as resources.  
- Some metadata from referenced resources will be present in state attributes of resources that use them.
### Example
data "azurerm_resource_group" "rg" { name = "existing" }

---

## Q27. Diff between for_each and count.
### Answer
`count` creates indexed resources using integers; `for_each` creates resources keyed by elements of a collection, allowing stable addressing with maps/sets.
### Follow-Up Points
- `for_each` is better with maps for predictable keys.  
- `count` indexed addressing can shift when elements removed, causing resource recreation.
### Example
resource "azurerm_nic" "nic" { for_each = var.nics ... }

---

## Q28. Is count only for integers? Why is deleting in count difficult?
### Answer
`count` accepts a numeric value for the number of instances. Deleting indexed items can change indices of subsequent resources, leading to recreation; thus deletion can be disruptive.
### Follow-Up Points
- Prefer `for_each` with keyed maps for stable identities.  
- Manage deletions carefully to avoid churn.
### Example
resource "aws_instance" "vm" { count = 3 ... }  # indices 0..2

---

## Q29. Write code using module + for_each.
### Answer
You can iterate modules using `for_each` with a map of configurations.
### Follow-Up Points
- Use unique keys for each module instance.  
- Each instance can reference `each.key` and `each.value`.
### Example
module "app" {
  for_each = var.apps
  source   = "./modules/app"
  name     = each.key
  config   = each.value
}

---

## Q30. If count=0, what happens?
### Answer
Terraform creates zero instances of the resource; the resource is effectively not present. This can be used to conditionally create resources.
### Follow-Up Points
- Modules and resources with count=0 produce no instances.  
- Ensure references handle absence to avoid errors.
### Example
resource "aws_instance" "optional" { count = var.create ? 1 : 0 ... }

---

## Q31. What is lifecycle block — give 2–3 arguments, can it work on storage account?
### Answer
`lifecycle` controls create/update/delete behavior. Common arguments: `create_before_destroy`, `prevent_destroy`, `ignore_changes`. Yes, lifecycle works on most resources including storage accounts to control replacement behavior.
### Follow-Up Points
- `create_before_destroy` helps zero-downtime replacement.  
- `prevent_destroy` prevents accidental deletes.  
- `ignore_changes` avoids overwriting fields modified outside Terraform.
### Example
lifecycle { create_before_destroy = true prevent_destroy = false ignore_changes = [tags] }

---

## Q32. What are lifecycle rules declared inside resource?
### Answer
Rules such as `create_before_destroy`, `prevent_destroy`, and `ignore_changes` that alter resource lifecycle behavior and edge-case handling.
### Follow-Up Points
- Use `ignore_changes` for fields set by external systems.  
- `prevent_destroy` should be used carefully with critical prod resources.
### Example
resource "azurerm_storage_account" "sa" { lifecycle { prevent_destroy = true } }

---

## Q33. What is dependency — implicit & explicit? Share syntax.
### Answer
Implicit dependency occurs when a resource references another resource's attribute; explicit dependency uses `depends_on` to force ordering without a direct attribute reference.
### Follow-Up Points
- Prefer implicit dependencies for clarity.  
- Use `depends_on` for non-obvious ordering requirements.
### Example
resource "azurerm_lb" "lb" { depends_on = [azurerm_public_ip.pip] }

---

## Q34. What is Terraform dependency? (general)
### Answer
Terraform dependency is the relationship that determines resource creation order based on references or explicit `depends_on`.
### Follow-Up Points
- Terraform builds a dependency graph to plan safe changes.  
- Correct dependencies avoid race conditions and failures.
### Example
resource "azurerm_vm" "vm" { network_interface_ids = [azurerm_network_interface.nic.id] }

---

## Q35. Difference between provider and provisioner?
### Answer
A provider is a plugin interfacing with APIs to manage resources; a provisioner runs scripts or commands on created resources (e.g., to configure software).
### Follow-Up Points
- Use providers for resource lifecycle; provisioners only for post-creation tasks.  
- Prefer cloud-init, extensions, or configuration management over provisioners.
### Example
provider "azurerm" { }  vs provisioner "remote-exec" { inline = ["apt-get install -y ..."] }

---

## Q36. What is Terraform workspace and why is it used?
### Answer
Workspaces enable multiple distinct states from the same configuration (useful for simple environment separation like dev/stage/prod). Each workspace has its own state.
### Follow-Up Points
- For complex setups, separate backends per environment may be clearer.  
- Workspaces are convenient for quick, lightweight environment separation.
### Example
terraform workspace new dev
terraform workspace select prod

---

## Q37. Diff between root and child module.
### Answer
Root module is the configuration in the current working directory; child modules are external modules referenced by the root module using `module` blocks.
### Follow-Up Points
- Root module orchestrates child modules.  
- Child modules encapsulate reusable logic.
### Example
# root -> module "vnet" { source = "./modules/vnet" }

---

## Q38. Diff between pattern module and root-child module.
### Answer
A pattern module (or reusable module) is a standardized template used across projects; root-child refers to the hierarchical relation where the root calls child modules. Pattern modules are designed for reuse across teams.
### Follow-Up Points
- Pattern modules are parameterized and documented.  
- Root-child is the execution relationship.
### Example
module "network" { source = "git::ssh://.../modules/network.git" }

---

## Q39. Resource module vs pattern module.
### Answer
A resource module focuses on creating a single resource type (like a storage account); a pattern module bundles a pattern of resources (networking pattern, AKS pattern) to implement a common architecture.
### Follow-Up Points
- Use resource modules for small, testable units.  
- Use pattern modules for opinionated, higher-level constructs.
### Example
Resource module: modules/storage  
Pattern module: modules/platform-with-vnet-nsg

---

## Q40. VM created with Terraform, then Microsoft Office installed. If you run terraform apply again, will Office be removed or stay?
### Answer
Office installation lives on the VM filesystem; Terraform won't remove it because it manages VM resource state, not files inside. Provisioners could be re-run depending on triggers, but by default installed software will remain.
### Follow-Up Points
- Provisioners are not idempotent by default; re-running may reinstall but not remove installed apps.  
- Use configuration management for consistent state.
### Example
Provisioner remote-exec installs Office script — subsequent apply won't remove Office.

---

## Q41. Virtual machine template + script to join domain — which provisioner ensures VM joins domain after build?
### Answer
`remote-exec` or cloud-init/VM extension (like Custom Script Extension for Azure) can run the join script. Extensions are preferable to Terraform provisioners for reliability.
### Follow-Up Points
- Use VM extensions in cloud providers for post-deploy configuration.  
- Ensure network and domain creds are available securely.
### Example
az vm extension set --publisher Microsoft.Compute --name CustomScriptExtension ...

---

## Q42. Team member exposed password in Terraform template, checked into repo — how will you remove it?
### Answer
Remove secret from history using tools like `git filter-repo` or BFG, rotate the exposed secret immediately, and replace with secure secret storage (Key Vault/Secrets Manager) and update pipeline to prevent future commits.
### Follow-Up Points
- Revoke/rotate compromised credentials instantly.  
- Use pre-commit hooks (detect-secrets) and branch protection policies.  
- Educate the team on secret management.
### Example
Use BFG Repo-Cleaner to delete the file from history and rotate the secret.

