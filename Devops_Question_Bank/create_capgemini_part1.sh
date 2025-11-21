#!/bin/bash
set -e

BASE="LTI-Mindtree"
mkdir -p "$BASE"

echo "Creating Docker-Containers.md, Scripting.md, Security-Secrets.md, Troubleshooting.md, General.md ..."

###############################################
# Docker / Containers – LTI Mindtree
###############################################

cat > "$BASE/Docker-Containers.md" << 'EOF'
# Docker / Containers – LTI Mindtree Interview Questions

## Q1. Why multistage Dockerfile?
### Answer
Multistage Dockerfiles reduce final image size by separating build and runtime environments. Build tools stay in the build stage and never reach the final image.
### Follow-Up Points
- Improves security  
- Faster deployments  
- Smaller image → lower storage cost  
### Example
FROM golang AS builder  
RUN go build -o app  
FROM alpine  
COPY --from=builder /app /app

---

## Q2. Docker networking concepts.
### Answer
Docker networking allows containers to communicate using different drivers: bridge, host, overlay, and macvlan.
### Follow-Up Points
- Default network = bridge  
- Overlay used in Swarm  
- Host mode removes isolation  
### Example
docker network ls

---

## Q3. Difference between ADD and COPY.
### Answer
`COPY` simply copies files from source to image.  
`ADD` can copy + extract archives + fetch URLs.
### Follow-Up Points
- Prefer COPY for clarity  
- ADD has extra behaviors → avoid unless needed  
### Example
COPY . /app  
ADD file.tar.gz /extract/

---

## Q4. Difference between CMD and ENTRYPOINT.
### Answer
CMD = default arguments  
ENTRYPOINT = main command that always runs
### Follow-Up Points
- ENTRYPOINT + CMD combination recommended  
- CMD can be overridden easily  
### Example
ENTRYPOINT ["python"]  
CMD ["app.py"]

---

## Q5. Have you used HEALTHCHECK in Dockerfile?
### Answer
Yes — HEALTHCHECK monitors container health by running periodic commands.
### Follow-Up Points
- Helps detect unhealthy containers  
- Works with orchestrators like Kubernetes  
### Example
HEALTHCHECK CMD curl -f http://localhost/ || exit 1

---

## Q6. Have you used Docker Compose?
### Answer
Yes — Docker Compose defines multi-container applications using a YAML file.
### Follow-Up Points
- Useful for local development  
- Supports scaling & environment variable injection  
### Example
docker-compose up -d

EOF


###############################################
# Scripting – LTI Mindtree
###############################################

cat > "$BASE/Scripting.md" << 'EOF'
# Scripting – LTI Mindtree Interview Questions

## Q1. PowerShell scripting — what scripts have you written?
### Answer
Scripts for VM health checks, log collection, Azure automation, patch validation, and REST API calls.
### Follow-Up Points
- Automation Account runbooks  
- Azure resource clean-up  
- Report generation
### Example
Get-EventLog -LogName System -Newest 20

---

## Q2. Write a script to check memory or space.
### Answer
Use Bash/PowerShell to check disk or memory thresholds and print status.
### Follow-Up Points
- Add alerting  
- Automate in cron/scheduler  
### Example (Bash)
#!/bin/bash  
mem=$(free -m | awk '/Mem/ {print $3/$2 * 100}')  
echo "Memory: $mem%"

---

## Q3. Have you used Bash?
### Answer
Yes — used for CI/CD tasks, Terraform pipelines, VM monitoring, automation scripts.
### Follow-Up Points
- Good for Linux automation  
- Used in DevOps pipelines  
### Example
if [[ -n "$VAR" ]]; then echo "Valid"; fi

---

## Q4. Scripts for provisioning/automation or pipelines?
### Answer
Yes — used scripts for provisioning VMs, validating deployments, generating reports, and automating pipeline tasks.
### Follow-Up Points
- Combine with Terraform  
- Check logs, health, ports  
### Example
curl -I http://localhost:80

EOF


###############################################
# Security / Secrets – LTI Mindtree
###############################################

cat > "$BASE/Security-Secrets.md" << 'EOF'
# Security / Secrets – LTI Mindtree Interview Questions

## Q1. How do you store secrets in pipeline?
### Answer
Store secrets in secure variable groups, Key Vault integration, or pipeline secret variables.
### Follow-Up Points
- Never store secrets in YAML  
- Use Key Vault tasks for retrieval  
- RBAC controls access  
### Example
variables:
- name: dbpass
  value: $(db-password)

---

## Q2. How do you manage secrets in Azure DevOps?
### Answer
Use variable groups, Key Vault references, secure files, and service connections with restricted permissions.
### Follow-Up Points
- Enable secret=true  
- Use Managed Identity or SP  
- Limit variable read permissions  
### Example
Library → Variable Group → Link to pipeline.

---

## Q3. How do you secure Terraform state file?
### Answer
Store in encrypted remote backend + RBAC + versioning + soft delete + not storing sensitive values in code.
### Follow-Up Points
- Use Key Vault for secrets  
- Private endpoints for storage  
- Separate state per environment  
### Example
Azure Storage + access policy + private endpoint.

---

## Q4. Where do you store secrets in CI/CD?
### Answer
Inside Azure Key Vault, variable groups, GitHub encrypted secrets, or Vault-based secret stores.
### Follow-Up Points
- Do not store secrets in repo  
- Use OIDC for GitHub  
- Rotate secrets periodically  
### Example
System-assigned identity → Get secret from Key Vault.

EOF


###############################################
# Troubleshooting – LTI Mindtree
###############################################

cat > "$BASE/Troubleshooting.md" << 'EOF'
# Troubleshooting – LTI Mindtree Interview Questions

## Q1. How do you troubleshoot VM?
### Answer
Check RDP/SSH, NSG rules, CPU/memory usage, disk space, system logs, agent status, and network path.
### Follow-Up Points
- Validate boot diagnostics  
- Check service health  
- Check identity/permissions  
### Example
sudo journalctl -xe

---

## Q2. If you’re not able to SSH into VM, what steps will you take?
### Answer
Check NSG rules, VM running state, SSH service, username/key, firewall settings, and reset SSH via Azure portal.
### Follow-Up Points
- Verify NIC configuration  
- Check route table  
- Use Serial Console  
### Example
az vm repair extension

---

## Q3. Website hosted on VM is slow — how do you troubleshoot?
### Answer
Check CPU, memory, disk I/O, network latency, app logs, and load balancer/NSG rules.
### Follow-Up Points
- Analyze with Azure Monitor  
- Check backend health  
- Review web server logs  
### Example
sudo tail -f /var/log/nginx/error.log

---

## Q4. AKS deployment issues — how to debug?
### Answer
Check pod events, logs, image pull errors, RBAC, node capacity, and failed probes.
### Follow-Up Points
- kubectl describe  
- kubectl logs  
- Check HPA + cluster autoscaler  
### Example
kubectl describe pod <pod>

---

## Q5. SSL certificate issues in pipeline or VM — how to manage?
### Answer
Validate certificate chain, expiration, bindings, Key Vault integration, and HTTPS configuration.
### Follow-Up Points
- Generate CSR correctly  
- Sync new cert with App Gateway  
- Use Let's Encrypt automation  
### Example
openssl x509 -in cert.pem -text -noout

EOF


###############################################
# General / Mixed – LTI Mindtree
###############################################

cat > "$BASE/General.md" << 'EOF'
# General / HR + Technical – LTI Mindtree Interview Questions

## Q1. Can you tell me about your projects?
### Answer
Explain architecture, tools, your responsibilities, challenges, and achievements.
### Follow-Up Points
- Highlight DevOps tools  
- Mention CI/CD + Terraform + AKS  
- Mention problem-solving  
### Example
Terraform → AKS → ACR → Monitoring pipeline.

---

## Q2. Give your introduction.
### Answer
A short overview of your background, skills, certifications, and career goals.
### Follow-Up Points
- Keep under 1 minute  
- Highlight cloud & DevOps stack  
- Mention achievements  
### Example
“I work with Azure, Terraform, ADO, AKS, and automation.”

---

## Q3. Daily routine — explain your role.
### Answer
Talk about daily monitoring, CI/CD work, infra automation, troubleshooting, and meetings with team.
### Follow-Up Points
- Mention ticketing  
- Mention deployments  
- Mention standup + reviews  
### Example
“Monitor pipelines, fix infra issues, enhance automation.”

---

## Q4. What is CI vs CD vs Continuous Delivery?
### Answer
CI = integrate code frequently  
CD = automate deployments  
Continuous Delivery = ready for production anytime  
Continuous Deployment = automatic push to production
### Follow-Up Points
- CI runs tests/builds  
- CD focuses on deployment pipeline  
### Example
CI: Build & test  
CD: Deployment automation

EOF

echo "PART 4 complete — All LTI Mindtree Markdown files created."
