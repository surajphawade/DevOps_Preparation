# CI/CD – Persistent Systems Interview Questions

## Q1. What is the difference between a reusable workflow and a composite action?
### Answer
A reusable workflow is a full workflow that can be called from other workflows; a composite action is a custom action made from multiple steps that behaves like a single action.
### Follow-Up Points
- Composite actions are reusable building blocks  
- Reusable workflows support jobs, permissions, environment  
- Composite actions run inside a single job
### Example
Reusable Workflow:
uses: org/repo/.github/workflows/deploy.yml@main  
Composite Action:
action with multiple steps hidden behind `uses: ./action`

---

## Q2. Do you know how GitHub Action workflow is written?
### Answer
Yes, workflows are written in YAML under `.github/workflows/` and define triggers, jobs, and steps.
### Follow-Up Points
- Trigger types: push, pull_request, schedule  
- Jobs run in runners (ubuntu, windows, self-hosted)  
- Steps use shell scripts or actions
### Example
name: CI  
on: [push]  
jobs:  
  build:  
    runs-on: ubuntu-latest

---

## Q3. What are actions and how do they work?
### Answer
Actions are reusable units that perform tasks in a workflow.
### Follow-Up Points
- Can be marketplace actions or custom actions  
- They run inside steps  
- Provide abstractions like login, deploy, test
### Example
uses: actions/checkout@v3

---

## Q4. What checkout action do you use? What version?
### Answer
`actions/checkout@v3` is commonly used for better performance and security.
### Follow-Up Points
- Always specify version  
- Avoid @master  
- Checkout pulls code into runner
### Example
uses: actions/checkout@v3

---

## Q5. Build metrics in GitHub Actions — have you heard of them?
### Answer
Build metrics track performance, duration, concurrency, artifact sizes, and workflow success rates.
### Follow-Up Points
- Helps optimize pipeline performance  
- Available under GitHub Actions Insights  
- Useful for DevOps KPIs
### Example
Insights → Workflow Summary → Metrics graphs

---

## Q6. While deploying infra from GitHub Actions you get timeout in Azure CLI — what will you check?
### Answer
Check Azure authentication, service principal permissions, resource lock, network connectivity, and retry logic.
### Follow-Up Points
- Validate az login or azure/login action  
- SP must have correct roles (Contributor)  
- Check if long-running TF apply exceeded timeout  
- Increase action timeout if needed
### Example
jobs.<job>.timeout-minutes: 60

---

## Q7. How do you deploy a CI/CD pipeline and what are you following in your organization?
### Answer
Define pipeline stages, integrate with repo, build/test/deploy automatically, and follow branching and approval strategy.
### Follow-Up Points
- Multi-stage pipeline for dev → QA → prod  
- Use gated approvals  
- Enforce quality checks and scanning
### Example
Azure DevOps: Build stage → Release stage → Manual approval → Deploy.

---

## Q8. What are gates in Azure DevOps?
### Answer
Gates are pre-deployment checks for approvals, queries, or validations before a stage is executed.
### Follow-Up Points
- Helps enforce security and quality  
- Examples: work item check, health check API  
- Used in release pipelines
### Example
Gate to ensure "Work items must be linked" before deployment.

---

## Q9. What is service connection?
### Answer
A service connection allows pipelines to authenticate to Azure, AWS, GitHub, or other external systems.
### Follow-Up Points
- Uses SP for Azure  
- Limit access scopes  
- Rotate credentials
### Example
Azure RM service connection in DevOps for Terraform apply.

---

## Q10. What are basic components in ADO?
### Answer
Repos, Pipelines, Boards, Artifacts, Test Plans.
### Follow-Up Points
- Repos for code  
- Pipelines for CI/CD  
- Boards for agile  
- Artifacts for package hosting
### Example
Using Boards to track user stories for infrastructure tasks.

---

## Q11. What is stakeholder in ADO?
### Answer
Stakeholder is a read-only or limited role used for managers/business users who need visibility but not edit rights.
### Follow-Up Points
- Cannot create pipelines  
- Can see dashboards  
- Useful for reporting
### Example
Stakeholder views progress on Azure Boards.

---

## Q12. What are security best practices in ADO?
### Answer
Use least privilege, secure service connections, enable pipelines permissions, protect branches, and use variable groups with secrets.
### Follow-Up Points
- Protect main/master  
- Enable retention policies  
- Block force pushes  
- Use approvals & checks
### Example
Require PR review + pipeline validation before merging to main.

---

## Q13. If coder pushes insecure code — how do you stop it? What steps include?
### Answer
Integrate SAST tools, enable code scanning, linting, secret scanning, and block merge if scans fail.
### Follow-Up Points
- Use SonarQube or GitHub Advanced Security  
- Check for secrets with Trufflehog  
- Enable branch policies
### Example
Security scan step in pipeline → fail when vulnerabilities > threshold.

---

## Q14. Multi-stage pipeline runs only one stage — how troubleshoot?
### Answer
Check branch conditions, stage dependencies, approvals, environment checks, pipeline variables, and trigger rules.
### Follow-Up Points
- Check `dependsOn`  
- Check `condition:` syntax  
- Verify environment approvals  
- Verify pipeline YAML indentation
### Example
condition: eq(variables['Build.SourceBranch'], 'refs/heads/main')

