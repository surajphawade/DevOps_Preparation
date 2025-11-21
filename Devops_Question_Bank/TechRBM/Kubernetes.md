# Kubernetes – TechRBM Interview Questions

## Q1. What is an init container in Kubernetes?
### Answer
Init containers run before application containers in a Pod to perform initialization tasks (e.g., create files, wait for services). They must complete successfully before the main containers start.
### Follow-Up Points
- Useful for setup tasks that need to finish prior to main process.  
- They run sequentially if multiple init containers are defined.
### Example
initContainers: - name: init-db image: busybox command: ["sh","-c","until nc -z db 5432; do sleep 2; done"]

