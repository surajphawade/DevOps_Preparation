# Azure Cloud — Unknown / Mixed-Source Questions (Questions + Answers)

## Networking

Q1. What is VNet?
A1. Virtual Network (VNet) is an isolated network in Azure used to host resources securely.

Q2. What is Subnet?
A2. A subnet is a range of IP addresses within a VNet used to partition and secure resources.

Q3. What is peering?
A3. VNet peering connects two VNets so resources can communicate privately and with low latency.

Q4. How do you restrict services on a resource?
A4. Use NSGs, Firewall rules, Private Endpoints, Resource locks, and Azure Policy to restrict access.

Q5. What is NSG & priority?
A5. Network Security Group contains rules with priority numbers; lower values are evaluated first.

Q6. What is Application Gateway?
A6. An L7 load balancer with features like path-based routing, SSL termination, and WAF.

Q7. Difference between Load Balancer and Application Gateway?
A7. Load Balancer is layer-4 (TCP/UDP) for network traffic; Application Gateway is layer-7 for HTTP/HTTPS routing and WAF.

Q8. What is service endpoint?
A8. Service Endpoints allow secure access to Azure services over Azure backbone by extending VNet identity.

Q9. What is private endpoint?
A9. Private Endpoint assigns a private IP from your VNet to an Azure service, making it reachable via private IP.

## Compute

Q10. What is VMSS?
A10. Virtual Machine Scale Sets manage a set of identical VMs and support autoscaling.

Q11. How do you patch VMs?
A11. Use Update Management, Azure Automation, VM extensions, or image updates for patching.

Q12. How do you troubleshoot VM connectivity?
A12. Check NSG rules, route tables, firewall, VM status, boot diagnostics, serial console, and network watcher.

## Storage

Q13. What is blob storage?
A13. Object storage for unstructured data in Azure with hot/cool/archive tiers.

Q14. What storage is used for Azure secrets?
A14. Azure Key Vault stores secrets, keys, and certificates securely (backed by HSM if required).

## SQL / Databases

Q15. Difference between Azure SQL PaaS vs SQL on VM.
A15. Azure SQL PaaS is managed with automated backups, patching, scaling; SQL on VM requires OS and DB management.

Q16. If SQL DB is deleted, how do you recover?
A16. Use point-in-time restore or geo-restore if backups/retention are enabled.

Q17. How to connect SQL DB with application?
A17. Use secure connection strings stored in Key Vault or app configuration with managed identity for credentials.

## Monitoring

Q18. What is Log Analytics?
A18. Centralized Azure service to collect and query logs and metrics via Kusto Query Language (KQL).

Q19. What is Application Insights?
A19. Application performance monitoring service for applications (telemetry, dependencies, traces).

Q20. How do you configure Azure Monitor alerts?
A20. Create alert rules for metrics or log queries, attach action groups for notifications/actions.

