# CI/CD – United Layer

## Q1. What is Azure Pipeline?
### Answer
CI/CD workflow for build, test, and deployment automation.
### Follow-Up Points
- YAML based  
### Example
trigger: main.

---

## Q2. Draft pipeline in YAML?
### Answer
Define stages → jobs → tasks → environment → approvals.
### Follow-Up Points
- Reusable templates  
### Example
stages: build → deploy.

---

## Q3. How to deploy containers using pipeline?
### Answer
Build image → push to ACR → kubectl/Helm deploy.
### Follow-Up Points
- Use service connection  
### Example
az acr build.

---

## Q4. CI/CD with Kubernetes?
### Answer
Push image → update manifests → rollout deployment → verify health.
### Follow-Up Points
- Rolling updates  
### Example
kubectl set image.

