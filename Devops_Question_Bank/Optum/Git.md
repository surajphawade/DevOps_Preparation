# Git / Version Control – Optum

## Q1. Git fetch vs Git pull?
### Answer
Fetch = download commits  
Pull = fetch + merge.
### Follow-Up Points
- Pull may cause conflicts  
### Example
git fetch origin.

---

## Q2. Manage merge conflicts.
### Answer
Use rebase/merge tools, fix conflicts manually, commit final version.
### Follow-Up Points
- Keep branch updated  
### Example
git merge main.

---

## Q3. Ensure secrets are not committed.
### Answer
Use .gitignore, secret scanners, pre-commit hooks, Key Vault, and PR checks.
### Follow-Up Points
- Rotate leaked secrets  
### Example
git-secrets hook.

