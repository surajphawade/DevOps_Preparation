# CI/CD – Optum

## Q1. What is Azure pipeline?
### Answer
A CI/CD service that builds, tests, scans, and deploys applications.
### Follow-Up Points
- Supports YAML and classic  
### Example
pipeline.yml → build → deploy.

---

## Q2. Draft pipeline in YAML.
### Answer
Define trigger → stages → jobs → tasks.
### Follow-Up Points
- Keep stages modular  
### Example
stages: build → deploy.

---

## Q3. Types of agents in ADO.
### Answer
Microsoft-hosted, Self-hosted.
### Follow-Up Points
- Self-hosted for custom tools  
### Example
Pool: SelfHosted.

---

## Q4. Uses of build & release pipelines.
### Answer
Build pipeline → compile & test  
Release pipeline → deploy to environments.
### Follow-Up Points
- Artifacts flow  
### Example
Build → Publish Artifact → Release.

---

## Q5. What is deployment strategy?
### Answer
Approach to release updates safely—rolling, canary, blue-green.
### Follow-Up Points
- Reduce downtime  
### Example
Blue-green for critical apps.

---

## Q6. Types of deployment strategies.
### Answer
Recreate, Rolling, Blue-Green, Canary.
### Follow-Up Points
- Choose based on risk level  

---

## Q7. How do you manage approvals?
### Answer
Use ADO Environments → approval gates → manual reviewers.
### Follow-Up Points
- Stage-based control  
### Example
Approvers for prod.

---

## Q8. CI/CD with Kubernetes.
### Answer
Build → push image → update manifests → deploy via kubectl/Helm.
### Follow-Up Points
- Use namespaces  
### Example
kubectl apply -f deployment.yaml.

---

## Q9. Deploy containers using pipelines.
### Answer
Build Docker image → push to ACR → deploy to AKS using Kubernetes tasks.
### Follow-Up Points
- RBAC + service connection  
### Example
Helm upgrade --install.

