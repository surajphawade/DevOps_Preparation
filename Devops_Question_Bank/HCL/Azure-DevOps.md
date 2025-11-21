# Azure DevOps – HCL Interview Questions

## Q1. What are gates in Azure DevOps?
### Answer
Gates are automated quality checks that run before a deployment stage is allowed to proceed.
### Follow-Up Points
- Ensures compliance & quality  
- Can call REST APIs, monitor alerts, query work items  
- Used in Release pipelines
### Example
Gate: ensure “incident count = 0” before production deploy.

---

## Q2. Is macOS supported as an agent pool?
### Answer
Yes, Microsoft-hosted macOS agents are available. Self-hosted macOS agents are also supported.
### Follow-Up Points
- Use macOS agents for iOS builds  
- Not commonly used for infra deployments
### Example
pool: vmImage: 'macos-latest'

---

## Q3. What is service connection?
### Answer
A service connection authorizes Azure DevOps pipelines to access cloud platforms or external services.
### Follow-Up Points
- Uses service principal for Azure  
- Scopes should be minimal  
- Used in CI/CD pipelines for deployments
### Example
Azure RM service connection → used by Terraform tasks.

---

## Q4. What are the things required while creating a service connection?
### Answer
Subscription ID, Tenant ID, Client ID, Client Secret, and permissions for the service principal.
### Follow-Up Points
- Grant least privilege  
- Validate permission with test connection  
- Store secrets securely
### Example
Assign contributor role → create service connection → use in YAML.

---

## Q5. What is stakeholder in ADO?
### Answer
A stakeholder is a read-only/light-access role for project members who need visibility but not editing capabilities.
### Follow-Up Points
- Can view Boards  
- Cannot run pipelines  
- Suitable for managers/business users
### Example
Stakeholder role assigned via Project Settings → Permissions.

---

## Q6. What are security best practices in ADO?
### Answer
Use least privilege access, enable branch policies, secure service connections, protect pipelines, and enforce MFA.
### Follow-Up Points
- Enable PR approvals  
- Block direct push to main  
- Use variable groups (secret = true)  
- Rotate SP credentials regularly
### Example
Enable "Require at least 1 reviewer" + build validation.

---

## Q7. What is task group?
### Answer
Task group allows grouping multiple pipeline tasks into a reusable template across pipelines.
### Follow-Up Points
- Helps standardize builds  
- Useful for shared steps like TF init/plan  
- Version controlled
### Example
"Terraform-Init-Plan" task group reused across repos.

---

## Q8. What is deployment group?
### Answer
A deployment group is a set of target servers (agents) that receive deployments via Release pipelines.
### Follow-Up Points
- Used for on-prem / VM deployments  
- Agents installed manually  
- Deprecated in favor of Environments
### Example
Deployment group → add VM agent → deploy app.

---

## Q9. What is basic in ADO? (General ADO concepts)
### Answer
Refers to basic Azure DevOps concepts: Repos, Pipelines, Boards, Artifacts, and Test plans.
### Follow-Up Points
- Repo → Git  
- Pipeline → CI/CD  
- Boards → Agile  
- Test → QA workflows
### Example
Typical workflow: Code → CI Build → CD Release.

---

## Q10. How can you secure ADO?
### Answer
Enforce branch protections, use least privilege on repos/pipelines, secure service connections, and enable auditing.
### Follow-Up Points
- Enable MFA for users  
- Disable classic PAT tokens  
- Use role-based access
### Example
Protect main branch with: PR required + Build validation.

---

## Q11. Difference between sprint and work item.
### Answer
Work item = single task/bug/user story.  
Sprint = time-boxed development period that contains many work items.
### Follow-Up Points
- Sprint is an iteration  
- Work items are deliverables  
- Used for agile tracking
### Example
Sprint = 2 weeks; contains ~15 stories.

---

## Q12. What is sprint?
### Answer
A sprint is a fixed-length iteration (usually 1–3 weeks) used to plan and deliver work.
### Follow-Up Points
- Part of Agile Scrum  
- Sprint backlog created from product backlog
### Example
Sprint planning → sprint execution → sprint review.

---

## Q13. What is work item?
### Answer
A unit of work such as a Story, Task, Bug, Issue, Epic.
### Follow-Up Points
- Has states: New → Active → Resolved → Closed  
- Linked to commits and PRs  
- Tracked in Boards
### Example
Task: "Create Terraform module for VNet."

---

## Q14. How to prevent a user in ADO from Boards but allow access to pipeline & repo?
### Answer
Modify user permissions to deny Boards access while keeping access to Repos and Pipelines.
### Follow-Up Points
- Use permission overrides  
- Remove Boards-specific roles  
- Keep Contributor on Repo/Pipeline
### Example
Project Settings → Permissions → Remove Board access.

---

## Q15. If 2 teams have same repo access, how to set auto PR raise on code changes?
### Answer
Use branch policies + path filters + YAML triggers to create an automated PR process.
### Follow-Up Points
- Use Git hooks or GitHub Actions for auto PR  
- Define default reviewers  
- Use static analysis for blocking
### Example
On push → create PR to main using automation workflow.

