# Containers / Docker – Capgemini Interview Questions

## Q1. Do you know about Docker?
### Answer
Docker packages applications into containers with their dependencies so they run consistently everywhere.
### Follow-Up Points
- Containers are lightweight compared to VMs  
- Use images and layers to manage builds
### Example
Dockerfile: FROM node:14; COPY . /app; RUN npm install; CMD ["node","app.js"]

---

## Q2. Where do you keep your Docker images?
### Answer
In container registries like Azure Container Registry (ACR), Docker Hub, or private registries.
### Follow-Up Points
- Use ACR for Azure-integrated workflows  
- Tag images with semantic tags
### Example
docker push myregistry.azurecr.io/myapp:1.0.0

---

## Q3. What is a volume in Docker?
### Answer
A volume is persistent storage that lives outside the container filesystem and survives container restarts.
### Follow-Up Points
- Use volumes for DB data or logs  
- Named volumes are portable between runs
### Example
docker run -v dbdata:/var/lib/postgresql/data postgres

---

## Q4. What is the difference between Docker and VM?
### Answer
Containers share the host OS kernel (lighter, faster), VMs include a full OS per VM (heavier).
### Follow-Up Points
- Containers: faster start, higher density  
- VMs: stronger isolation
### Example
Containers run on Docker Engine; VM runs on hypervisor (Azure VM).

---

## Q5. What deployment strategies have you used?
### Answer
Blue-green, rolling, canary, and recreate.
### Follow-Up Points
- Blue-green for zero-downtime swaps  
- Canary for gradual rollout and monitoring
### Example
Kubernetes rolling update with maxSurge/maxUnavailable.

---

## Q6. Difference between Ingress vs LoadBalancer?
### Answer
Ingress is an HTTP(S) routing layer (L7) inside cluster; LoadBalancer exposes Service with cloud LB (L4).
### Follow-Up Points
- Use Ingress for path/host routing  
- LoadBalancer gives direct IP per service
### Example
Ingress rule routes /app to service app-svc on port 80.

---

## Q7. For autoscaling deployment, which service do we use?
### Answer
Use Horizontal Pod Autoscaler (HPA) in Kubernetes; VMSS for VM scaling in Azure.
### Follow-Up Points
- HPA uses CPU/memory or custom metrics  
- Combine HPA with cluster autoscaler
### Example
kubectl autoscale deployment myapp --min=2 --max=10 --cpu-percent=70

---

## Q8. What strategy is used by default in Deployment kind?
### Answer
RollingUpdate is the default deployment strategy in Kubernetes.
### Follow-Up Points
- Configure maxSurge and maxUnavailable  
- Ensures gradual replacement
### Example
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 25%
