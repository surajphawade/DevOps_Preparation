# Git — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What is Git fetch vs Git pull?
A1. `git fetch` downloads remote updates but doesn't merge; `git pull` does fetch + merge (or rebase) in one step.

Q2. Difference between Git commit vs Git push?
A2. `git commit` records changes to local repo; `git push` sends commits to remote.

Q3. What is merge conflict?
A3. When two changes affect the same lines/files and Git cannot automatically reconcile them.

Q4. How do you resolve merge conflicts?
A4. Inspect conflicting files, edit to resolve, stage, commit, and complete the merge; use merge tools if needed.

Q5. How to prevent pushing secrets to repo?
A5. Use `.gitignore`, pre-commit hooks, secret scanning tools, and store secrets in secret managers.

Q6. How to remove exposed secret from Git history?
A6. Use tools like `git filter-repo` or `git filter-branch` to rewrite history and then rotate the secret.

