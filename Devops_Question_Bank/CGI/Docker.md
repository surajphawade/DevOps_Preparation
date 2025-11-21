# Docker / Containers – CGI

## Q1. What is Docker?
### Answer
A container platform to package applications with dependencies.
### Follow-Up Points
- Lightweight & portable  
### Example
docker run nginx

---

## Q2. What is Dockerfile?
### Answer
A file containing build instructions for Docker images.
### Follow-Up Points
- Supports multi-stage builds  
### Example
FROM node:18 → COPY → RUN.

---

## Q3. Difference between Docker & VM?
### Answer
VM = hypervisor virtualizes hardware  
Docker = containers virtualize OS.
### Follow-Up Points
- Containers are lightweight  
### Example
VM boots in minutes; container in seconds.

