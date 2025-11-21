# CI/CD — Unknown / Mixed-Source Questions (Questions + Answers)

## Azure DevOps

Q1. What are gates?
A1. Gates are checks (like service hooks, queries) that run before or during deployment to validate readiness.

Q2. What is service connection?
A2. A secure connection in Azure DevOps that allows pipelines to authenticate to external services (Azure, Kubernetes, Docker registries).

Q3. What are build & release pipelines?
A3. Build pipelines compile/test and produce artifacts; release (or multi-stage) pipelines deploy artifacts to environments.

Q4. What is agent pool?
A4. A collection of agents available to execute pipeline jobs; can be Microsoft-hosted or self-hosted.

Q5. What is stakeholder?
A5. A low-privilege license type in ADO for users who need limited access to boards and work items.

Q6. What are deployment strategies?
A6. Rolling, Canary, Blue-Green, Recreate — strategies to release changes with varying risk controls.

Q7. How to configure approvals?
A7. Use environments and approvals in pipelines to require manual validation before certain stages run.

Q8. How to secure CI/CD pipeline?
A8. Use secret stores (Key Vault), service principals with least privilege, OIDC, restrict agent access, and protect logs.

Q9. How to skip a step in pipeline?
A9. Use conditional expressions (`condition:`) or parameters/variables to gate step execution.

Q10. Multi-stage pipeline → only one stage running — troubleshoot?
A10. Check YAML stage conditions, dependencies, triggers, agent availability, and previous-stage results.

Q11. How to store secure values in pipeline?
A11. Use secure variables, variable groups linked to Key Vault, or secret management features in the CI system.

## GitHub Actions

Q12. What is reusable workflow vs composite action?
A12. Reusable workflow is a callable workflow (full workflow) you can `uses:` from other workflows; composite action bundles multiple steps into a reusable action.

Q13. What is checkout action?
A13. `actions/checkout` fetches the repository contents for a workflow job.

Q14. Deployment rollback in GitHub Actions?
A14. Implement rollback steps in workflows (e.g., re-deploy previous image/tag) or use automated strategies that can revert on failure.

