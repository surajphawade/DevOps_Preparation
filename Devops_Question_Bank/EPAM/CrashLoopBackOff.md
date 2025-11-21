# Troubleshooting – EPAM

## Q1. Pods restarting continuously (CrashLoopBackOff)
### Answer
Check pod logs, events, image issues, environment variables, config errors, permissions, or failing probes.
### Follow-Up Points
- Check readiness/liveness probe  
- Check container exit code  
### Example
kubectl describe pod <pod-name>  
kubectl logs <pod-name> --previous

