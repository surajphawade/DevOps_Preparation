# CI/CD – Capgemini Interview Questions

## Q1. Write a YAML pipeline file.
### Answer
A YAML pipeline describes the build, test, and deploy stages for your application.
### Follow-Up Points
- Defined in a YAML file  
- Contains stages → jobs → steps  
- Helps automate CI/CD  
- Version-controlled
### Example
trigger:
  branches:
    include: [main]
stages:
  - stage: Build
    jobs:
      - job: Compile
        steps:
          - script: echo "building..."

---

## Q2. What is “short shift” in CI/CD?
### Answer
A short shift is a minimal version of the CI/CD pipeline that runs quickly for faster feedback.
### Follow-Up Points
- Runs only essential steps  
- Used during PR checks  
- Helps speed up development
### Example
Short shift = Build + Unit test only (no deployment)

---

## Q3. What is condition in CI/CD?
### Answer
Conditions control whether a job or step should run.
### Follow-Up Points
- Helps skip steps  
- Useful for branch-based logic  
- Prevents unnecessary tasks
### Example
condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))

---

## Q4. What is parameter in CI/CD?
### Answer
A parameter lets you pass dynamic values to the pipeline.
### Follow-Up Points
- Helps reuse templates  
- Supports types like string, boolean, object  
- Declared at top of YAML
### Example
parameters:
- name: environment  
  type: string  
  default: dev

---

## Q5. How to skip one step in pipeline?
### Answer
Use a condition that evaluates to false.
### Follow-Up Points
- Avoids running unwanted steps  
- Can be dynamic  
- Useful for PR-only or main-only steps
### Example
condition: false

---

## Q6. How to access secure values in pipeline?
### Answer
Use pipeline secret variables, variable groups, or Key Vault integration.
### Follow-Up Points
- Never print secrets  
- Use service connections  
- Use Azure Key Vault when possible
### Example
- task: AzureKeyVault@2  
  inputs:  
    ConnectedServiceName: serviceConnection  
    KeyVaultName: myKV

---

## Q7. How to set up self-hosted agent?
### Answer
Download agent package, configure using PAT, and register to agent pool.
### Follow-Up Points
- Must be online to run jobs  
- Use strong PAT token  
- Assign to correct pool
### Example
./config.sh --url <org-url> --auth pat

---

## Q8. Day-to-day pipeline tasks?
### Answer
Managing build failures, optimizing stages, updating tasks, and fixing CI/CD errors.
### Follow-Up Points
- Monitor pipelines  
- Improve performance  
- Update versioned tools  
- Add new jobs
### Example
N/A

---

## Q9. Have you worked on GitHub Actions?
### Answer
Yes, GitHub Actions uses workflow YAML files to automate CI/CD.
### Follow-Up Points
- Lives inside .github/workflows  
- Uses jobs and runners  
- Supports marketplace actions
### Example
name: CI  
on: [push]  
jobs:  
  build:  
    runs-on: ubuntu-latest  
    steps:  
      - run: echo "building"

---

## Q10. Rollback process in GitHub Actions?
### Answer
Re-deploy a previous tag or artifact using a workflow.
### Follow-Up Points
- Keep artifacts immutable  
- Use release tags  
- Use deploy workflow with version input
### Example
Workflow input → version: v1.0.3

---

## Q11. How to deploy to Azure from GitHub Actions?
### Answer
Use azure/login to authenticate and azure/webapps-deploy or ARM/Bicep/Terraform.
### Follow-Up Points
- Use SP credentials in secrets  
- Use workflow runner  
- Use ACR for containers
### Example
uses: azure/login@v1  
with:  
  creds: ${{ secrets.AZURE_CREDENTIALS }}

---

## Q12. How do you handle secrets in CI/CD?
### Answer
Store secrets securely in Key Vault or pipeline secret variable stores.
### Follow-Up Points
- Masked in logs  
- Least privilege  
- Rotate periodically
### Example
Azure DevOps → Library → Variable Group (secret=true)

---

## Q13. How do you integrate SonarQube?
### Answer
Run SonarQube scanner for analysis and send results to SonarQube server.
### Follow-Up Points
- Prepare → Analyze → Publish  
- Fail pipeline on bad quality gate  
- Use token in secure storage
### Example
- task: SonarQubePrepare  
- task: SonarQubeAnalyze  
- task: SonarQubePublish

