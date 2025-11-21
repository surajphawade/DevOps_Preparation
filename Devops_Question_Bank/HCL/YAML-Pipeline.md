# YAML / Pipeline – HCL Interview Questions

## Q1. Can you write a YAML file and explain it?
### Answer
Yes — a YAML pipeline defines triggers, jobs, steps, environments, and tasks used for CI/CD automation.
### Follow-Up Points
- Indentation is critical  
- Supports variables, stages, jobs  
- Can use templates for reusability
### Example
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  - script: echo "Build started"

---

## Q2. Write a YAML + explain stages.
### Answer
Stages separate the pipeline into logical blocks such as build, test, and deploy.
### Follow-Up Points
- Each stage can have approvals  
- Stages run sequentially or in parallel  
- Common in multi-environment pipelines
### Example
stages:
  - stage: Build
    jobs:
      - job: build_app
        steps:
          - script: npm install

  - stage: Deploy
    dependsOn: Build
    jobs:
      - job: deploy_app
        steps:
          - script: az webapp deploy

---

## Q3. Event & syntax in GitHub Actions.
### Answer
GitHub Actions use events (push, pull_request, schedule) to trigger workflows written in YAML under `.github/workflows/`.
### Follow-Up Points
- Jobs run on runners  
- Steps use actions or scripts  
- Workflows can call reusable workflows
### Example
name: CI  
on: [push]  
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

