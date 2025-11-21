# Git & Version Control – Capgemini Interview Questions

## Q1. What is Git squash and Git rebase? What is the difference?
### Answer
Squash combines multiple commits into one; rebase moves commits to a new base (rewrites history).
### Follow-Up Points
- Squash useful before merging PRs  
- Rebase keeps linear history but changes commit IDs  
- Avoid rebasing public branches
### Example
git rebase -i HEAD~5  # interactive rebase to squash commits

---

## Q2. What is Git fetch vs Git pull?
### Answer
Fetch downloads remote changes; pull = fetch + merge (or fetch + rebase).
### Follow-Up Points
- Use fetch to inspect changes before merging  
- Pull is convenient but may auto-merge
### Example
git fetch origin
git merge origin/main

---

## Q3. How to handle git conflicts?
### Answer
Open conflicting files, resolve differences, git add the files, and commit the merge.
### Follow-Up Points
- Use git status to find conflicts  
- Use git mergetool or manual edits  
- Communicate with authors when ambiguous
### Example
git mergetool

---

## Q4. If a commit contains a secret, how to stop it from pushing?
### Answer
Remove it from history (git filter-repo or BFG), rotate the secret immediately, and add preventive hooks.
### Follow-Up Points
- Rotate compromised keys immediately  
- Add pre-commit hooks to scan for secrets  
- Update .gitignore for sensitive files
### Example
Use BFG Repo-Cleaner or git filter-repo to remove sensitive data.

