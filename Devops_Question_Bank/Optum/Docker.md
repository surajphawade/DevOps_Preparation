# Docker / Containers – Optum

## Q1. Docker vs Kubernetes?
### Answer
Docker = container engine  
Kubernetes = orchestration platform.
### Follow-Up Points
- Docker builds images; K8s deploys them  
### Example
Docker → build; K8s → deploy.

---

## Q2. What is Docker image?
### Answer
Read-only template containing application code + dependencies.
### Follow-Up Points
- Built from Dockerfile  
### Example
docker build -t app:v1 .

---

## Q3. What is Dockerfile?
### Answer
Script with instructions to build Docker images.
### Follow-Up Points
- Use multi-stage builds  
### Example
FROM node:18 → COPY → RUN.

---

## Q4. Virtualization vs Containerization?
### Answer
VMs virtualize hardware; Containers virtualize OS.
### Follow-Up Points
- Containers = lightweight  
### Example
VM: GB-level; container: MB-level.

