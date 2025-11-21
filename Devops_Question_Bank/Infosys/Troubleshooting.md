# Troubleshooting – Infosys Interview Questions

## Q1. A user not able to connect to production VM — what steps to take?
### Answer
Check VM power state, NSG rules, firewall, Bastion/VPN access, credentials, and diagnostics logs.
### Follow-Up Points
- Check network route  
- Validate RBAC  
### Example
az network watcher test-connectivity

