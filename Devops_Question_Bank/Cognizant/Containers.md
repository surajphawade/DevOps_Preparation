# Containers – Cognizant (CTS)

## Q1. How do you deploy containers using Azure DevOps?
### Answer
Build Docker image → push to ACR → deploy to AKS or App Service using manifest/Helm.
### Follow-Up Points
- Use service connections  
- Use separate dev/stage/prod stages  
### Example
kubectl apply -f deployment.yaml

---

## Q2. Have you worked on Docker?
### Answer
Yes — used Dockerfiles, multi-stage builds, registries, health checks.
### Follow-Up Points
- Layer optimization  
- Security scanning  
### Example
docker build -t api:v1 .

