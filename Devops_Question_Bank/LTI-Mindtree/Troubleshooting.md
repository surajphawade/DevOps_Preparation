# Troubleshooting – LTI Mindtree Interview Questions

## Q1. How do you troubleshoot VM?
### Answer
Check RDP/SSH, NSG rules, CPU/memory usage, disk space, system logs, agent status, and network path.
### Follow-Up Points
- Validate boot diagnostics  
- Check service health  
- Check identity/permissions  
### Example
sudo journalctl -xe

---

## Q2. If you’re not able to SSH into VM, what steps will you take?
### Answer
Check NSG rules, VM running state, SSH service, username/key, firewall settings, and reset SSH via Azure portal.
### Follow-Up Points
- Verify NIC configuration  
- Check route table  
- Use Serial Console  
### Example
az vm repair extension

---

## Q3. Website hosted on VM is slow — how do you troubleshoot?
### Answer
Check CPU, memory, disk I/O, network latency, app logs, and load balancer/NSG rules.
### Follow-Up Points
- Analyze with Azure Monitor  
- Check backend health  
- Review web server logs  
### Example
sudo tail -f /var/log/nginx/error.log

---

## Q4. AKS deployment issues — how to debug?
### Answer
Check pod events, logs, image pull errors, RBAC, node capacity, and failed probes.
### Follow-Up Points
- kubectl describe  
- kubectl logs  
- Check HPA + cluster autoscaler  
### Example
kubectl describe pod <pod>

---

## Q5. SSL certificate issues in pipeline or VM — how to manage?
### Answer
Validate certificate chain, expiration, bindings, Key Vault integration, and HTTPS configuration.
### Follow-Up Points
- Generate CSR correctly  
- Sync new cert with App Gateway  
- Use Let's Encrypt automation  
### Example
openssl x509 -in cert.pem -text -noout

