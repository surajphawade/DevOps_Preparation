# Troubleshooting – United Layer

## Q1. Pod crashing — how do you debug?
### Answer
Check logs, events, probes, env vars, images, secrets, ports.
### Follow-Up Points
- Check exit code  
### Example
kubectl logs --previous.

---

## Q2. Developer unable to push code?
### Answer
Check repo permissions, branch policies, authentication, token expiry.
### Follow-Up Points
- Validate Azure DevOps access  
### Example
Reset PAT.

---

## Q3. Pipeline failing?
### Answer
Check logs, variables, service connections, YAML indentation, permissions.
### Follow-Up Points
- Validate agent  
### Example
Re-run failed stage.

---

## Q4. VM connectivity issue?
### Answer
Check NSG, firewall, IP, DNS, SSH/RDP settings, NIC issues.
### Follow-Up Points
- Use Serial Console  
### Example
Reset NIC.

---

## Q5. Application slow after deployment?
### Answer
Check CPU, memory, logs, backend health, scaling, probes, disk I/O.
### Follow-Up Points
- Use App Insights  
### Example
Check response times.

