# CI/CD – Orion

## Q1. Draft pipeline in YAML?
### Answer
Define stages → jobs → tasks → triggers → variables → service connections.
### Follow-Up Points
- Use templates  
### Example
stages: build → deploy.

---

## Q2. CI/CD for microservices?
### Answer
Build each microservice → push image → deploy to AKS using Helm or manifests.
### Follow-Up Points
- Namespace separation  
### Example
service1, service2 independent pipelines.

---

## Q3. CI/CD pipeline with Kubernetes?
### Answer
Build → push → image versioning → deployment updates → validation → monitoring.
### Follow-Up Points
- Use rolling updates  
### Example
kubectl apply -f deployment.yaml.

