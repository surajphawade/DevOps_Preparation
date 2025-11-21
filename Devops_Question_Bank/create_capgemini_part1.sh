#!/bin/bash
set -e

BASE="Unknown-Questions"
mkdir -p "$BASE"

echo "Creating Unknown / Mixed-Source question files (Q + A only)..."

########################################
# 1. Terraform
########################################
cat > "$BASE/Terraform.md" << 'EOF'
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

EOF

########################################
# 2. Kubernetes
########################################
cat > "$BASE/Kubernetes.md" << 'EOF'
# Kubernetes — Unknown / Mixed-Source Questions (Questions + Answers)

## Basics & Architecture

Q1. What is Kubernetes?
A1. Kubernetes is a container orchestration platform that automates deployment, scaling, and management of containerized applications.

Q2. What is pod?
A2. A pod is the smallest deployable unit in Kubernetes and can contain one or more containers that share network and storage.

Q3. What is Deployment?
A3. A Deployment manages stateless applications by creating ReplicaSets and enabling rolling updates.

Q4. What is StatefulSet?
A4. StatefulSet manages stateful applications that require stable network IDs and persistent storage.

Q5. Difference between Deployment and StatefulSet?
A5. Deployment is for stateless workloads and supports easy scaling; StatefulSet provides ordered, stable identities and persistent storage for each pod.

Q6. What is ReplicaSet?
A6. ReplicaSet ensures that a specified number of pod replicas are running at any time.

Q7. What is difference between ReplicaSet & Deployment?
A7. ReplicaSet maintains replica counts; Deployment manages ReplicaSets and strategy for updates.

## Services

Q8. What is ClusterIP?
A8. ClusterIP is the default internal-only service type exposing pods on a cluster-internal IP.

Q9. What is NodePort?
A9. NodePort exposes the service on a static port on each node’s IP for external access.

Q10. What is LoadBalancer?
A10. LoadBalancer provisions a cloud provider load balancer to expose the service externally.

Q11. What is Ingress?
A11. Ingress is an API object that manages external access to services, typically HTTP/HTTPS, with routing rules.

Q12. Difference between Ingress vs LoadBalancer?
A12. LoadBalancer exposes a single service with a public IP; Ingress routes traffic for multiple services through one entry point with L7 rules.

## Probes

Q13. What are liveness probes?
A13. Liveness probes detect if the application is alive — failing liveness triggers container restart.

Q14. What are readiness probes?
A14. Readiness probes indicate if a pod is ready to receive traffic; failing readiness removes pod from service endpoints.

Q15. What is startup probe?
A15. Startup probes allow slow-starting containers more time before liveness/readiness checks begin.

## Autoscaling

Q16. What is HPA?
A16. Horizontal Pod Autoscaler scales the number of pods based on observed metrics like CPU or custom metrics.

Q17. What is KEDA?
A17. KEDA is Kubernetes Event-driven Autoscaling that scales workloads based on external event sources (queues, Kafka, etc.).

## Troubleshooting

Q18. Pod is pending — how to troubleshoot?
A18. Check events (`kubectl describe pod`), node capacity, scheduling constraints, resource requests/limits, taints/tolerations, and PVC binding.

Q19. Pod in CrashLoopBackOff — steps to fix?
A19. Check pod logs, previous container logs, events, probe failures, environment variables, image compatibility, and resource limits.

Q20. How to check logs via CLI?
A20. Use `kubectl logs <pod>` (and `--previous` for crashed containers); `kubectl describe pod` for events.

Q21. How to check logs via GUI?
A21. Use provider console (Azure Portal → AKS → Workloads → Pods) or Kubernetes Dashboard / Log Analytics.

## YAML

Q22. What is YAML?
A22. YAML is a human-readable data-serialization language commonly used for Kubernetes manifests.

Q23. What is metadata?
A23. Metadata contains identity information such as name, namespace, labels, and annotations.

Q24. What is spec?
A24. `spec` defines the desired state of the resource (replicas, containers, ports, selectors).

Q25. Explain service.yaml.
A25. `service.yaml` defines a Service resource: `apiVersion`, `kind: Service`, `metadata`, and `spec` including `type`, `selector`, and ports.

EOF

########################################
# 3. Azure Cloud
########################################
cat > "$BASE/Azure-Cloud.md" << 'EOF'
# Azure Cloud — Unknown / Mixed-Source Questions (Questions + Answers)

## Networking

Q1. What is VNet?
A1. Virtual Network (VNet) is an isolated network in Azure used to host resources securely.

Q2. What is Subnet?
A2. A subnet is a range of IP addresses within a VNet used to partition and secure resources.

Q3. What is peering?
A3. VNet peering connects two VNets so resources can communicate privately and with low latency.

Q4. How do you restrict services on a resource?
A4. Use NSGs, Firewall rules, Private Endpoints, Resource locks, and Azure Policy to restrict access.

Q5. What is NSG & priority?
A5. Network Security Group contains rules with priority numbers; lower values are evaluated first.

Q6. What is Application Gateway?
A6. An L7 load balancer with features like path-based routing, SSL termination, and WAF.

Q7. Difference between Load Balancer and Application Gateway?
A7. Load Balancer is layer-4 (TCP/UDP) for network traffic; Application Gateway is layer-7 for HTTP/HTTPS routing and WAF.

Q8. What is service endpoint?
A8. Service Endpoints allow secure access to Azure services over Azure backbone by extending VNet identity.

Q9. What is private endpoint?
A9. Private Endpoint assigns a private IP from your VNet to an Azure service, making it reachable via private IP.

## Compute

Q10. What is VMSS?
A10. Virtual Machine Scale Sets manage a set of identical VMs and support autoscaling.

Q11. How do you patch VMs?
A11. Use Update Management, Azure Automation, VM extensions, or image updates for patching.

Q12. How do you troubleshoot VM connectivity?
A12. Check NSG rules, route tables, firewall, VM status, boot diagnostics, serial console, and network watcher.

## Storage

Q13. What is blob storage?
A13. Object storage for unstructured data in Azure with hot/cool/archive tiers.

Q14. What storage is used for Azure secrets?
A14. Azure Key Vault stores secrets, keys, and certificates securely (backed by HSM if required).

## SQL / Databases

Q15. Difference between Azure SQL PaaS vs SQL on VM.
A15. Azure SQL PaaS is managed with automated backups, patching, scaling; SQL on VM requires OS and DB management.

Q16. If SQL DB is deleted, how do you recover?
A16. Use point-in-time restore or geo-restore if backups/retention are enabled.

Q17. How to connect SQL DB with application?
A17. Use secure connection strings stored in Key Vault or app configuration with managed identity for credentials.

## Monitoring

Q18. What is Log Analytics?
A18. Centralized Azure service to collect and query logs and metrics via Kusto Query Language (KQL).

Q19. What is Application Insights?
A19. Application performance monitoring service for applications (telemetry, dependencies, traces).

Q20. How do you configure Azure Monitor alerts?
A20. Create alert rules for metrics or log queries, attach action groups for notifications/actions.

EOF

########################################
# 4. Data Engineering (ADF / ADB)
########################################
cat > "$BASE/Data-Engineering.md" << 'EOF'
# Data Engineering — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What is Azure Data Factory?
A1. A cloud ETL/ELT orchestration service for data movement and transformation.

Q2. Types of Integration Runtimes?
A2. Azure IR, Self-hosted IR, and SSIS IR.

Q3. Types of Data Flows?
A3. Mapping Data Flows and Wrangling Data Flows.

Q4. What is Mapping Data Flow?
A4. A visual data transformation feature in ADF implemented on Spark for ETL logic.

Q5. What is Wrangling Data Flow?
A5. A Power Query-based visual data preparation tool in ADF.

Q6. What activities have you used in ADF?
A6. Copy, Lookup, ForEach, Databricks, Stored Procedure, Execute Pipeline, Web, Wait.

Q7. Difference between Data Flow vs Databricks?
A7. Data Flow = visual ETL inside ADF; Databricks = full Spark environment for complex processing.

Q8. How to monitor ADF pipelines?
A8. Use ADF Monitor tab, pipeline run history, and integrate with Log Analytics and alerts.

Q9. How to create a Databricks cluster?
A9. Configure cluster name, runtime, worker type, autoscaling, network settings, and create via portal or API.

Q10. What is a production cluster?
A10. A stable, well-configured cluster with autoscaling and governance used for production workloads and jobs.

EOF

########################################
# 5. Docker / Containers
########################################
cat > "$BASE/Docker.md" << 'EOF'
# Docker — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What is Docker?
A1. A platform to build, ship, and run containers packaging applications with their dependencies.

Q2. What is Dockerfile?
A2. A text file with instructions to build a Docker image.

Q3. What is Docker image?
A3. A read-only template created from a Dockerfile used to instantiate containers.

Q4. What are Dockerfile instructions?
A4. Commands such as FROM, RUN, COPY, ADD, ENV, WORKDIR, CMD, ENTRYPOINT, EXPOSE.

Q5. Difference between CMD & ENTRYPOINT?
A5. CMD provides default arguments; ENTRYPOINT defines the executable; together they produce the final run command.

Q6. Difference between ADD & COPY?
A6. COPY copies files; ADD also supports remote URLs and auto-extracting archives — COPY is preferred for simplicity.

Q7. What is a multistage Dockerfile?
A7. A build that uses multiple FROM stages to compile and then copy artifacts into a smaller runtime image.

Q8. Docker networking types?
A8. Bridge, Host, Overlay, Macvlan, and None.

Q9. What is containerization vs virtualization?
A9. Virtualization emulates hardware to run full OSes (VMs); containerization isolates processes on the host OS, sharing kernel and being more lightweight.

EOF

########################################
# 6. CI/CD — Azure DevOps, GitHub Actions, Jenkins
########################################
cat > "$BASE/CI-CD.md" << 'EOF'
# CI/CD — Unknown / Mixed-Source Questions (Questions + Answers)

## Azure DevOps

Q1. What are gates?
A1. Gates are checks (like service hooks, queries) that run before or during deployment to validate readiness.

Q2. What is service connection?
A2. A secure connection in Azure DevOps that allows pipelines to authenticate to external services (Azure, Kubernetes, Docker registries).

Q3. What are build & release pipelines?
A3. Build pipelines compile/test and produce artifacts; release (or multi-stage) pipelines deploy artifacts to environments.

Q4. What is agent pool?
A4. A collection of agents available to execute pipeline jobs; can be Microsoft-hosted or self-hosted.

Q5. What is stakeholder?
A5. A low-privilege license type in ADO for users who need limited access to boards and work items.

Q6. What are deployment strategies?
A6. Rolling, Canary, Blue-Green, Recreate — strategies to release changes with varying risk controls.

Q7. How to configure approvals?
A7. Use environments and approvals in pipelines to require manual validation before certain stages run.

Q8. How to secure CI/CD pipeline?
A8. Use secret stores (Key Vault), service principals with least privilege, OIDC, restrict agent access, and protect logs.

Q9. How to skip a step in pipeline?
A9. Use conditional expressions (`condition:`) or parameters/variables to gate step execution.

Q10. Multi-stage pipeline → only one stage running — troubleshoot?
A10. Check YAML stage conditions, dependencies, triggers, agent availability, and previous-stage results.

Q11. How to store secure values in pipeline?
A11. Use secure variables, variable groups linked to Key Vault, or secret management features in the CI system.

## GitHub Actions

Q12. What is reusable workflow vs composite action?
A12. Reusable workflow is a callable workflow (full workflow) you can `uses:` from other workflows; composite action bundles multiple steps into a reusable action.

Q13. What is checkout action?
A13. `actions/checkout` fetches the repository contents for a workflow job.

Q14. Deployment rollback in GitHub Actions?
A14. Implement rollback steps in workflows (e.g., re-deploy previous image/tag) or use automated strategies that can revert on failure.

EOF

########################################
# 7. Git / Version Control
########################################
cat > "$BASE/Git.md" << 'EOF'
# Git — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What is Git fetch vs Git pull?
A1. `git fetch` downloads remote updates but doesn't merge; `git pull` does fetch + merge (or rebase) in one step.

Q2. Difference between Git commit vs Git push?
A2. `git commit` records changes to local repo; `git push` sends commits to remote.

Q3. What is merge conflict?
A3. When two changes affect the same lines/files and Git cannot automatically reconcile them.

Q4. How do you resolve merge conflicts?
A4. Inspect conflicting files, edit to resolve, stage, commit, and complete the merge; use merge tools if needed.

Q5. How to prevent pushing secrets to repo?
A5. Use `.gitignore`, pre-commit hooks, secret scanning tools, and store secrets in secret managers.

Q6. How to remove exposed secret from Git history?
A6. Use tools like `git filter-repo` or `git filter-branch` to rewrite history and then rotate the secret.

EOF

########################################
# 8. Scripting (Bash, PowerShell, Python)
########################################
cat > "$BASE/Scripting.md" << 'EOF'
# Scripting — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. $@ vs $* in Bash?
A1. `$@` expands to separate quoted arguments; `$*` expands to all arguments as a single word (less safe).

Q2. What is trap in Bash?
A2. `trap` registers a command to run on signals or EXIT for cleanup.

Q3. How to check if variable is empty?
A3. Use `[ -z "$VAR" ]` to test if variable is empty.

Q4. Write script to check VM disk >80% and send alert.
A4. Typical approach: use `df` to get usage, compare and trigger mail/alert (implement in monitoring or cron).

Q5. Write PowerShell script to check memory and show unhealthy message.
A5. Use `Get-Counter` or `Get-WmiObject` to read memory metrics and write logic to output unhealthy when threshold exceeded.

Q6. Python: Search word in lines.
A6. Read file line-by-line and use `in` or `re` to match a pattern; print matching lines with line numbers.

EOF

########################################
# 9. Security / Secrets / Compliance
########################################
cat > "$BASE/Security.md" << 'EOF'
# Security / Secrets / Compliance — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. How to secure Terraform state file?
A1. Use remote backend with encryption, RBAC, private endpoints, and enable versioning/soft-delete on storage.

Q2. How do you manage secrets in Kubernetes?
A2. Store secrets in Kubernetes Secrets, use external secret stores (Key Vault, Vault), and use CSI secrets drivers with RBAC and encryption.

Q3. Where do you store secrets in Azure DevOps?
A3. Use secure pipeline variables, variable groups linked to Key Vault, or service connections with managed identities.

Q4. How do you integrate Azure Key Vault with pipelines?
A4. Use Key Vault tasks or native secret variable groups to fetch secrets at runtime using managed identity or service principal.

Q5. How to stop developer from committing secrets?
A5. Enforce pre-commit hooks, server-side scanning, PR checks, and developer training. Rotate secrets if leaked.

Q6. How do you manage SSL certificates?
A6. Store certs in Key Vault, use App Gateway for SSL termination, and automate renewal with Let's Encrypt or certificate automation.

EOF

########################################
# 10. Microservices / Architecture
########################################
cat > "$BASE/Microservices.md" << 'EOF'
# Microservices / Architecture — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What are microservices?
A1. Small, loosely coupled services that implement a single business capability and communicate over APIs or messaging.

Q2. What is microservices architecture?
A2. Architectural style that decomposes applications into independent deployable services, each with its own data and lifecycle.

Q3. How does Application Gateway handle multiple apps?
A3. Via path-based or host-based routing rules that map incoming requests to different backend pools/services.

EOF

########################################
# 11. Networking / CIDR
########################################
cat > "$BASE/Networking.md" << 'EOF'
# Networking / CIDR — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. If you need 1000 IPs, which CIDR will you select?
A1. Use a /22 network (2^(32-22) = 1024 addresses), which meets 1000 IP requirement.

Q2. IP availability if subnet has 16 IPs?
A2. A /28 has 16 total addresses. In generic networking 14 are usable (network + broadcast reserved); in Azure the platform reserves 5 addresses, so usable = 11.

Q3. CIDR calculation formula?
A3. Number of IPs = 2^(32 - prefix_length). Usable hosts = total minus reserved addresses (network/broadcast or cloud provider reserves).

EOF

########################################
# 12. Scenarios / Troubleshooting
########################################
cat > "$BASE/Troubleshooting.md" << 'EOF'
# Scenarios / Troubleshooting — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. Website hosted on VM is slow — how will you troubleshoot?
A1. Check VM CPU/memory/disk I/O, web server logs, network latency, database performance, load balancer health, and scaling configuration.

Q2. Developer unable to connect to prod VM — steps?
A2. Check NSG/firewall, SSH/RDP credentials, VPN/Bastion, IP address, DNS, boot diagnostics, and RBAC permissions.

Q3. Pod restarting continuously — troubleshoot?
A3. Inspect logs, previous container logs, events, exit codes, probe failures, resource constraints, and config/secret errors.

Q4. Pipeline failing after apply — what do you do?
A4. Examine pipeline logs, check partially created resources, inspect state and backend, undo or fix failures, and restore state or import resources if needed.

Q5. How to debug Azure CLI timeout in GitHub pipeline?
A5. Increase timeout, ensure network connectivity to Azure, verify credentials/service principal, check API throttling, and capture debug logs for the CLI.

Q6. Deployment stuck in lock state — how to fix?
A6. Identify and safely remove the lock from the backend (e.g., release Azure Storage lease or use `terraform force-unlock` after confirming no concurrent runs).

EOF

echo "All Unknown / Mixed-Source question files created under $BASE/"
