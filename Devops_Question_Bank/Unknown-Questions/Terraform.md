# Terraform — Unknown / Mixed-Source Questions (Questions + Answers)

## State, Backend, Locking

Q1. What supported locations are available to store Terraform state?
A1. Typical options: remote backends such as Azure Storage (azurerm), AWS S3 (with DynamoDB locking), Google Cloud Storage, HashiCorp Terraform Cloud/Enterprise, and other supported backends.

Q2. When is the Terraform state file created?
A2. The state file is created after the first successful `terraform apply` (and `terraform init` prepares the backend).

Q3. If a variable is marked sensitive — what happens in the state file?
A3. Sensitive variables are still part of state if used to create resources; Terraform tries to redact sensitive outputs in logs, but the state may contain values unless you avoid storing secrets in resources or use data sources/Key Vaults.

Q4. If default value is not given, will the value appear in state file?
A4. Only values that are used to create or configure resources appear in state. Providing a variable without a default doesn't by itself add an entry until applied.

Q5. What is state locking?
A5. State locking prevents concurrent `apply` operations by acquiring a lock on the remote backend (e.g., DynamoDB for S3, leases for Azure Storage) to avoid corruption.

Q6. Why is Terraform state needed?
A6. State tracks the mapping between Terraform configuration and real-world resources so Terraform can compute diffs and update resources idempotently.

Q7. What if state file gets deleted?
A7. You must restore it from backup or reconstruct state using `terraform import` for each resource. Use backend versioning and backups to avoid this.

Q8. How to recover from state drift?
A8. Detect drift with `terraform plan`, then either update the configuration to match reality, import resources into state, or apply changes to reconcile drift. Use careful planning and backups.

## Commands

Q9. What is terraform init?
A9. Initializes a working directory: downloads providers, sets up backend, and prepares modules.

Q10. What is terraform plan?
A10. Shows the proposed changes Terraform will make to reach the desired state; a dry-run.

Q11. What is terraform apply?
A11. Executes changes to create/update/destroy resources according to the plan.

Q12. What is terraform fmt?
A12. Formats Terraform configuration files to canonical style.

Q13. What is terraform show?
A13. Displays Terraform state or a saved plan in a human-readable format.

## Variables / Types

Q14. What are variable types in Terraform?
A14. Basic types: string, number, bool; complex types: list, map, set, object, tuple.

Q15. What is type constraint?
A15. A variable type declaration that enforces the expected shape/type of the value.

Q16. What is custom validation?
A16. `validation { condition = ... }` blocks on variables to enforce custom rules and produce friendly errors.

Q17. How to write validation to allow only 0–10 numbers?
A17. Use a validation block with a condition like `validation { condition = var.my_var >= 0 && var.my_var <= 10 }`.

Q18. What is the difference between terraform.tfvars and variables.tf?
A18. `variables.tf` declares variables and their types; `terraform.tfvars` provides concrete values for those variables.

## Modules / Providers / Provisioners

Q19. What is module?
A19. A reusable, encapsulated set of Terraform configuration (folder or remote source) that can be called with `module` blocks.

Q20. What is provider?
A20. A plugin that lets Terraform interact with a specific cloud/API (e.g., azurerm, aws).

Q21. What is provisioner?
A21. A block (`local-exec` / `remote-exec` / `file`) that runs scripts/commands on resources for bootstrapping — generally used sparingly.

Q22. What is null resource?
A22. A Terraform resource with no provider-managed resource; useful to trigger provisioners or run local actions.

Q23. What is data source?
A23. A `data` block reads information about existing resources without managing them.

Q24. Will data block appear in state file?
A24. Data sources are not typically stored as resources in state; they are read during plan/apply and not tracked as managed resources.

## for_each / count

Q25. Difference between for_each and count?
A25. `count` is integer-indexed and best for simple lists; `for_each` iterates over maps/sets and gives stable keys for addressing instances.

Q26. Why deletion is difficult with count?
A26. `count` uses numeric indices; removing an item can shift indices and cause Terraform to destroy and recreate resources unexpectedly.

Q27. Write module code with for_each.
A27. (Concept) Use `for_each = var.items` in the module/resource and reference `each.key` / `each.value` inside.

Q28. What happens if count=0?
A28. Terraform creates zero instances of that resource — effectively it is omitted.

## Lifecycle

Q29. What are lifecycle rules?
A29. `lifecycle` meta-argument controls resource behavior: `create_before_destroy`, `prevent_destroy`, `ignore_changes`.

Q30. What arguments are available in lifecycle block?
A30. Common: `create_before_destroy`, `prevent_destroy`, `ignore_changes`, and `replace_triggered_by` in newer versions.

Q31. Can lifecycle be used on storage account?
A31. Yes — lifecycle can be declared on most resources to control replacement or ignore specific attributes.

## Dependencies

Q32. What is implicit dependency?
A32. Terraform infers dependencies from resource references (e.g., `resourceA.id` used by `resourceB`).

Q33. What is explicit dependency?
A33. Using `depends_on` meta-argument to force an ordering.

Q34. How does Terraform create dependency graph?
A34. By analyzing resource arguments and references to build a graph used to plan and order operations.

## Workspaces & Environments

Q35. What is Terraform workspace?
A35. Workspace provides isolated state for the same configuration (useful for simple environment separation).

Q36. How do you manage dev/stage/prod in Terraform?
A36. Use separate workspaces, remote backends, or separate state files and/or distinct variable files and module parameters for environment-specific configs.

## Real Scenarios

Q37. VM created using Terraform → additional software installed manually → what happens next run?
A37. Terraform won't track manual changes; unless the provisioning is managed by Terraform, subsequent runs will not remove local changes but may replace resources if config changes require it.

Q38. Terraform apply failed after partial infrastructure creation → what steps you take?
A38. Inspect `terraform plan` and state, fix root cause, remove partial resources if necessary, restore state from backup or import resources, then re-run plan/apply.

Q39. How do you rename .tfvars file and still execute?
A39. Provide `-var-file` option to `terraform plan`/`apply` with the new filename or set environment vars accordingly.

