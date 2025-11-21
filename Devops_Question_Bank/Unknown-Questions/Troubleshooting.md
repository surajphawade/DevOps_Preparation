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

