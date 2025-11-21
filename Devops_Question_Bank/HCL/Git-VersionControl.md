# Git / Version Control – HCL Interview Questions

## Q1. Difference between Git fetch and Git pull.
### Answer
`git fetch` downloads the latest commits but does not merge them;  
`git pull` downloads and automatically merges into your current branch.
### Follow-Up Points
- Safer to run fetch first to review changes  
- pull = fetch + merge  
- Use fetch in CI pipelines to avoid auto conflicts
### Example
git fetch origin  
git pull origin main

---

## Q2. Git push vs Git commit.
### Answer
`git commit` saves changes locally in your repository;  
`git push` sends your committed changes to the remote repository.
### Follow-Up Points
- Commit is offline  
- Push requires remote URL + permissions  
- Push is blocked if branch policies exist (PR required)
### Example
git commit -m "updated module"  
git push origin feature/devops

---

## Q3. How to ensure password exposed in repo is removed?
### Answer
Remove from the latest commit, purge it from Git history, rotate the leaked secret, and enable secret scanning to prevent future leaks.
### Follow-Up Points
- Use BFG Repo-Cleaner or git filter-repo  
- Force push after history rewrite  
- Rotate all exposed credentials  
- Add pre-commit hooks to check secrets
### Example
bfg --delete-files "secret.txt"  
git push --force  
Rotate password in Key Vault or Secrets Manager.

