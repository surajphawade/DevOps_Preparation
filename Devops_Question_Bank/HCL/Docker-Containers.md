# Docker / Containers – HCL Interview Questions

## Q1. Have you worked on Docker?
### Answer
Yes, Docker is used to containerize applications so they run consistently across environments. We create Dockerfiles, build images, store them in registries (ACR/Docker Hub), and deploy them through Kubernetes or pipelines.
### Follow-Up Points
- Follow multi-stage builds  
- Use .dockerignore for optimization  
- Scan images for vulnerabilities  
- Push images to ACR → used by AKS
### Example
docker build -t myapp:v1 .  
docker push myregistry.azurecr.io/myapp:v1

---

## Q2. What is volume in Docker?
### Answer
A Docker volume is a persistent storage mechanism that stores data outside the container filesystem, so data remains even if the container is recreated.
### Follow-Up Points
- Volume types: local, host, NFS  
- Important for DB containers  
- Managed by Docker Engine, not inside the image  
- Preferred over bind mounts for portability
### Example
docker volume create mydata  
docker run -v mydata:/var/lib/mysql mysql:latest

