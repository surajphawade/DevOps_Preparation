#!/bin/bash
set -e

BASE="HCL"
mkdir -p "$BASE"

echo "Writing Docker-Containers.md, Git-VersionControl.md, Scripting.md ..."

###############################################
# Docker / Containers – HCL
###############################################

cat > "$BASE/Docker-Containers.md" << 'EOF'
# Docker / Containers – HCL Interview Questions

## Q1. Have you worked on Docker?
### Answer
Yes, Docker is used to containerize applications so they run consistently across environments. We create Dockerfiles, build images, store them in registries (ACR/Docker Hub), and deploy them through Kubernetes or pipelines.
### Follow-Up Points
- Follow multi-stage builds  
- Use .dockerignore for optimization  
- Scan images for vulnerabilities  
- Push images to ACR → used by AKS
### Example
docker build -t myapp:v1 .  
docker push myregistry.azurecr.io/myapp:v1

---

## Q2. What is volume in Docker?
### Answer
A Docker volume is a persistent storage mechanism that stores data outside the container filesystem, so data remains even if the container is recreated.
### Follow-Up Points
- Volume types: local, host, NFS  
- Important for DB containers  
- Managed by Docker Engine, not inside the image  
- Preferred over bind mounts for portability
### Example
docker volume create mydata  
docker run -v mydata:/var/lib/mysql mysql:latest

EOF


###############################################
# Git / Version Control – HCL
###############################################

cat > "$BASE/Git-VersionControl.md" << 'EOF'
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

EOF


###############################################
# Scripting – HCL
###############################################

cat > "$BASE/Scripting.md" << 'EOF'
# Scripting – HCL Interview Questions

## Q1. Have you worked on PowerShell?
### Answer
Yes, PowerShell is used for automating tasks on Windows systems—checking system health, managing resources, executing Azure CLI/REST commands, and writing automation scripts.
### Follow-Up Points
- Use modules like Az module  
- Supports object-based output  
- Good for Azure automation
### Example
Get-Process | Sort-Object CPU -Descending

---

## Q2. Have you worked on Bash?
### Answer
Yes, Bash is used for Linux automation tasks, writing CI/CD scripts, validating variables, monitoring system resources, and integrating with Terraform/Azure CLI.
### Follow-Up Points
- Often used in pipelines  
- Good for file/text operations  
- Supports traps, arrays, functions
### Example
#!/bin/bash  
echo "Deploying infrastructure..."

---

## Q3. Difference between $@ and $* ?
### Answer
`$@` treats quoted arguments as separate;  
`$*` treats all arguments as one big string.
### Follow-Up Points
- `$@` is safer in loops  
- `$*` collapses arguments  
- Important in script parameter handling
### Example
for arg in "$@"; do echo $arg; done

---

## Q4. How to check if variable has non-empty value?
### Answer
Use `-n` or double brackets to check if the variable contains a value.
### Follow-Up Points
- Validate input variables in scripts  
- Prevent runtime failures
### Example
if [[ -n "$VAR" ]]; then echo "not empty"; fi

---

## Q5. What is trap in bash?
### Answer
`trap` is used to catch signals (exit, interrupt, errors) and run commands before the script stops.
### Follow-Up Points
- Used for cleanup  
- Catch SIGINT, SIGTERM  
- Improves reliability of long scripts
### Example
trap "echo 'Cleaning up...'; rm -f temp.txt" EXIT

EOF

echo "PART 3 completed — Docker-Containers.md, Git-VersionControl.md, Scripting.md created."
