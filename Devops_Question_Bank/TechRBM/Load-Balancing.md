# Azure Load Balancing / Application Gateway – TechRBM Interview Questions

## Q1. 10 VMs hosting 10 applications — how to integrate Application Gateway?
### Answer
Use Application Gateway (AppGW) as an ingress/load balancer for HTTP/HTTPS. Configure backend pools with VMs or their NICs, set routing rules and path-based routing to map different hostnames/paths to specific backend pools. Use health probes per application. Alternatively, place an Application Gateway in front of an AKS ingress controller for containerized apps.
### Follow-Up Points
- Use path-based routing to direct /app1 → VM1, /app2 → VM2.  
- Use WAF feature for security.  
- For non-HTTP traffic, use Azure Load Balancer.
### Example
AppGW routing rule: host/app1 → backend pool with VM1 IP.

