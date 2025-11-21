# Cloud Architecture / Azure Deployment – TechRBM Interview Questions

## Q1. You have a local project: Node API, Kafka, Zookeeper, PostgreSQL. Deploy on Azure Secure Gateway with AKS + Load Balancer — How will you deploy this? (architecture/design)
### Answer
Containerize each component (Node API, Kafka broker, Zookeeper, Postgres) as Docker images. Push images to a private registry (ACR). Provision AKS cluster with nodepools sized for workload. Use StatefulSets for Kafka/Zookeeper (stable identities + PVCs) and Deployments for stateless Node API. Use PersistentVolumeClaims backed by Azure Disks or Azure Files for Postgres and Kafka storage. Expose Node API via Kubernetes Service + Azure LoadBalancer or Ingress (Application Gateway/NGINX). Use Azure Private Link / Private Endpoints or VPN/ExpressRoute for “Secure Gateway” (restrict public access). Use Azure Key Vault for secrets and Managed Identity for authentication. Configure monitoring (Prometheus + Grafana or Azure Monitor).
### Follow-Up Points
- Use StatefulSet + Headless Service for Kafka/Zookeeper.  
- Use Readiness/Liveness probes and resource requests/limits.  
- Secure traffic with private endpoints / ingress WAF.  
- Backup Postgres (Azure Backup or scheduled pg_dump to Storage).  
### Example
1. Build & push images to ACR.  
2. terraform/az cli → create AKS + ACR + VNet + Subnets + NSG.  
3. kubectl apply -f zookeeper-statefulset.yaml  
4. kubectl apply -f kafka-statefulset.yaml  
5. kubectl apply -f postgres-pvc-deployment.yaml  
6. Deploy Node API and configure ingress (appgw-ingress).

