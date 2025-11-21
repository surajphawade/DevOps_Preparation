# General DevOps / Architecture – Capgemini Interview Questions

## Q1. Introduce yourself.
### Answer
A short summary highlighting experience, role, skills, and a key project.
### Follow-Up Points
- Keep it to 40–60 seconds  
- Mention tools you used  
- Mention your impact (automation, reliability)
### Example
"I am Suraj, L2 Support/DevOps Engineer with 3 years of experience in Azure, Terraform, CI/CD, and Kubernetes. I worked at TD Bank on cloud automation and data operations."

---

## Q2. Explain project with Node API, Kafka, Zookeeper, Postgres.
### Answer
Describe a microservices architecture where API publishes/consumes messages through Kafka, Zookeeper manages brokers, and Postgres stores persistent data.
### Follow-Up Points
- Kafka used for decoupled communication  
- Scalable consumer groups  
- API load-balanced & containerized
### Example
Node API → Kafka topic → Consumer service → Writes to Postgres.

---

## Q3. How to deploy local project on Azure Secure Gateway with AKS and Load Balancer?
### Answer
Containerize the app, push to registry, create AKS deployment/service, expose it via LoadBalancer or Application Gateway.
### Follow-Up Points
- Use ACR for images  
- Use Ingress/AGIC for routing  
- Secure with NSG & private endpoints
### Example
AKS deployment + service YAML + AGIC ingress for internal access.

---

## Q4. What are microservices and their architecture?
### Answer
Microservices break a large monolith into independently deployable services each handling a specific domain/function.
### Follow-Up Points
- Each service can scale independently  
- Uses API Gateway  
- Uses independent DB or schema
### Example
Auth Service, Payment Service, Order Service communicating via REST or Kafka.

---

## Q5. 10 VMs running 10 apps — how integrate Application Gateway?
### Answer
Application Gateway routes HTTP traffic to backend pools based on path/host rules.
### Follow-Up Points
- Path-based routing  
- Health probes for each VM  
- SSL termination for security
### Example
/app1 → VM1; /app2 → VM2 via AG routing rules.

---

## Q6. If one storage account is used by teams and you modify via Terraform — what happens?
### Answer
Terraform may try to recreate or update the storage account, causing disruption.
### Follow-Up Points
- Use `lifecycle ignore_changes`  
- Take backup  
- Notify dependent teams
### Example
lifecycle { ignore_changes = [network_rules] }

---

## Q7. If subnet has 16 IPs, how many usable?
### Answer
Azure reserves 5 IPs, so usable = 16 - 5 = 11.
### Follow-Up Points
- .0 = network  
- .1/.2/.3 reserved  
- .255 = broadcast
### Example
/28 subnet → 16 IPs → 11 usable.

---

## Q8. Which CIDR for 1000 IPs?
### Answer
/22 provides 1024 IP addresses.
### Follow-Up Points
- 32 - 22 = 10 bits → 2^10 = 1024  
- /23 = 512  
- /24 = 256
### Example
Use /22 for mid-size clusters.

