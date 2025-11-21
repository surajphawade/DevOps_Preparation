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

