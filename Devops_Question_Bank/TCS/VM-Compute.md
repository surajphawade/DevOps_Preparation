# Virtual Machines / Compute – TCS

## Q1. Methods to create a VM.
### Answer
Portal, Azure CLI, ARM template, Terraform, Azure DevOps pipeline.
### Follow-Up Points
- Use IaC for consistency  
### Example
az vm create --name myvm --image UbuntuLTS

---

## Q2. User cannot connect to VM — steps?
### Answer
Check power state, NSG, firewall, Bastion/VPN, credentials, route table, boot diagnostics.
### Follow-Up Points
- Use Azure Network Watcher  
- Check identity permissions  
### Example
az network watcher test-connectivity --source client --dest vm

