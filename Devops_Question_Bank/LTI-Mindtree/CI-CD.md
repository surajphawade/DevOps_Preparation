# CI/CD – LTI Mindtree Interview Questions

## Q1. Write Azure Pipeline using YAML and explain each stage.
### Answer
A YAML pipeline defines triggers, variables, stages, jobs, and steps for CI/CD automation. Each stage contains one or more jobs that run tasks.
### Follow-Up Points
- Use separate stages for Build, Test, Deploy  
- YAML allows templates, parameters, conditions  
- Pipeline integrates with repos and variable groups
### Example
stages:
  - stage: Build
    jobs:
      - job: build
        steps:
          - script: echo "Building..."
  - stage: Deploy
    dependsOn: Build
    jobs:
      - job: deploy
        steps:
          - script: echo "Deploying..."

---

## Q2. Apart from Terraform infra, what else can you automate?
### Answer
Application deployment, container builds, security scans, test automation, VM patching, configuration management, Key Vault rotation, and monitoring setup.
### Follow-Up Points
- Automate secrets, governance policies  
- Automate Docker image builds  
- Automate validation tests after deploy
### Example
Pipeline automates: app → container build → ACR push → AKS deploy.

---

## Q3. Do you know any scripting?
### Answer
Yes — Bash, PowerShell, and Python (optional) for automating infra tasks, pipelines, and debugging.
### Follow-Up Points
- Used for Terraform wrappers  
- Used in build/release pipelines  
- Useful for health checks & validations
### Example
#!/bin/bash  
df -h | grep "/dev/"

---

## Q4. Explain complete CI/CD process followed in your company.
### Answer
Code → PR → Build pipeline → Tests → Security Scans → Artifact creation → Deploy to dev → Approvals → Deploy to stage → Deploy to prod.
### Follow-Up Points
- Use branch policies  
- Use environment approvals  
- Use variable groups + service connections
### Example
Build → Publish Artifact → Release → ARM/Terraform Deploy → Smoke Tests.

---

## Q5. Why use GitOps?
### Answer
GitOps ensures infrastructure and application deployments are driven by Git as the single source of truth.
### Follow-Up Points
- Declarative, version-controlled deployments  
- Rollbacks via git revert  
- Automated delivery via Git triggers
### Example
Push → GitOps operator pulls repo → updates AKS.

---

## Q6. Steps to create pipeline in Azure DevOps.
### Answer
Create pipeline → Choose repo → Select YAML/classic → Configure tasks → Add triggers → Save & run.
### Follow-Up Points
- Configure service connections  
- Add variable groups  
- Add environment approvals
### Example
Azure DevOps → Pipelines → New pipeline → GitHub/Azure Repos.

---

## Q7. If you have two subscriptions in Azure DevOps, how do you give access to new resources?
### Answer
Use provider aliases in Terraform or create separate service connections mapped to each subscription.
### Follow-Up Points
- One service connection per subscription  
- Use RBAC (Contributor or custom role)  
- Use variable groups to store subscription IDs
### Example
provider "azurerm" {
  alias           = "sub2"
  subscription_id = var.sub2_id
  features        = {}
}

---

## Q8. How do you deploy containers using Azure DevOps?
### Answer
Build Docker image → Push to ACR → Deploy to AKS/App Service using YAML pipeline.
### Follow-Up Points
- Use Docker task or inline script  
- Use Kubernetes manifest task  
- Ensure service connection has ACR/Aks permissions
### Example
docker build .  
docker push acr.azurecr.io/app:v1  
kubectl apply -f deployment.yaml

