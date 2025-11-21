# Troubleshooting – Optum

## Q1. Pod CrashLoopBackOff.
### Answer
Check logs, events, image errors, readiness probe failures.
### Follow-Up Points
- Fix config issues  
### Example
kubectl describe pod <pod>.

---

## Q2. Troubleshoot pipeline failure.
### Answer
Check logs, task failures, permissions, secret access, path issues.
### Follow-Up Points
- Check agent pool  
### Example
Enable system.debug.

---

## Q3. VM connectivity issue.
### Answer
Check NSG, firewall, Bastion/VPN, credentials, boot diagnostics.
### Follow-Up Points
- Check route table  
### Example
az network watcher test-connectivity.

---

## Q4. Website slow on VM.
### Answer
Check CPU, memory, disk, network, logs, app performance, and scaling.
### Follow-Up Points
- Check IIS/nginx logs  
### Example
sudo tail -f /var/log/nginx/error.log.

