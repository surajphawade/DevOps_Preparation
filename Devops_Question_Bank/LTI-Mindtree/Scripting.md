# Scripting – LTI Mindtree Interview Questions

## Q1. PowerShell scripting — what scripts have you written?
### Answer
Scripts for VM health checks, log collection, Azure automation, patch validation, and REST API calls.
### Follow-Up Points
- Automation Account runbooks  
- Azure resource clean-up  
- Report generation
### Example
Get-EventLog -LogName System -Newest 20

---

## Q2. Write a script to check memory or space.
### Answer
Use Bash/PowerShell to check disk or memory thresholds and print status.
### Follow-Up Points
- Add alerting  
- Automate in cron/scheduler  
### Example (Bash)
#!/bin/bash  
mem=$(free -m | awk '/Mem/ {print $3/$2 * 100}')  
echo "Memory: $mem%"

---

## Q3. Have you used Bash?
### Answer
Yes — used for CI/CD tasks, Terraform pipelines, VM monitoring, automation scripts.
### Follow-Up Points
- Good for Linux automation  
- Used in DevOps pipelines  
### Example
if [[ -n "$VAR" ]]; then echo "Valid"; fi

---

## Q4. Scripts for provisioning/automation or pipelines?
### Answer
Yes — used scripts for provisioning VMs, validating deployments, generating reports, and automating pipeline tasks.
### Follow-Up Points
- Combine with Terraform  
- Check logs, health, ports  
### Example
curl -I http://localhost:80

