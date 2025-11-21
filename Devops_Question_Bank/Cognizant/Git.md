# Git / Version Control – Cognizant (CTS)

## Q1. How do you manage secrets and prevent pushing them?
### Answer
Use .gitignore, secret scanning tools, commit hooks, Key Vault, and CI pipeline policies.
### Follow-Up Points
- Rotate leaked secrets  
- Use branch protection  
### Example
git-secrets or GitGuardian scanning.

---

## Q2. Git best practices.
### Answer
Use branching strategy, PR reviews, commit messages, tagging, and branch protections.
### Follow-Up Points
- Avoid pushing directly to main  
- Use feature branches  
### Example
PR → CI tests → Approvals → Merge.

