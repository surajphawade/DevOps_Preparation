
## 🏗️ Project Theme (very realistic)

**Migrate a legacy on-prem .NET web + SQL application to Azure using DevOps**

---

## 🔶 Phase-wise Migration Flow (what exactly happens in real companies)

| Phase         | On-Prem                         | Cloud Re-Creation                          |
| ------------- | ------------------------------- | ------------------------------------------ |
| Infra         | VM + IIS                        | App Service / AKS, VNet, NSGs, App Gateway |
| DB            | SQL Server                      | Azure SQL Managed Instance                 |
| Configuration | Web.config, JSON stored locally | Azure App Config + Key Vault               |
| CI/CD         | Manual build on Jenkins/local   | Azure DevOps YAML pipelines                |
| Deployments   | Manual copy to IIS              | Blue-Green / Slot-based deployments        |
| Monitoring    | Local logs                      | App Insights + Log Analytics               |

---

## 🔥 High-Level Architecture – Before vs After

### 🟥 On-Prem (Before migration)

```
Users → Firewall → Load Balancer → IIS VM → App Code
                          ↓
                      SQL Server VM
                          ↓
        Shared file storage (scripts, PDF, logs)
```

### 🟩 Azure Cloud (After migration)

```
Users → WAF/App Gateway → VNet → App Service (or AKS)
                                   ↓
                            Azure SQL MI (Private Endpoint)
                                   ↓
                          Storage Account (File Share/Blob)
                                   ↓
                       Key Vault + App Config for secrets
                                   ↓
                  CI/CD via Azure DevOps (ACR + Pipelines)
```

---

## 🧱 What you will build during practice (exactly like enterprise)

🔹 Terraform modules
🔹 Azure DevOps CI pipeline (build + test + container + push to ACR)
🔹 Azure DevOps CD pipeline (deploy to App Service or AKS)
🔹 Key Vault + App Config integration
🔹 Blue-Green deployment slots

---

## 📌 Hands-on Roadmap (step-by-step to practise)

### **Step 1 — Recreate On-Prem Setup Locally**

This simulates legacy system:

* Build a **.NET web application** or use a sample public repo
* Local **SQL Server Express database**
* Config in **web.config / appsettings.json**
* Build manually in Visual Studio (simulate old DevOps)

> This is your “before migration” environment.

---

### **Step 2 — Terraform Infra Coding**

Create infra from scratch using modules:

📁 **terraform/modules**

```
/resource_group
/vnet
/subnet
/nsg
/key_vault
/app_service (or /aks)
/acr
/storage
/sql_mi
```

📁 **terraform/env/dev / qa / prod**

```
main.tf
variables.tf
backend.tf
```

Terraform backend → Azure Storage state
Terraform apply → creates full infra.

---

### **Step 3 — Containerize application**

Add:

```
Dockerfile
.dockerignore
```

Build locally → run container → fix issues.

---

### **Step 4 — Push code to GitHub/Azure Repos**

Repository structure:

```
/src                → Application Code
/infra              → Terraform
/pipelines          → YAML pipeline templates
```

---

### **Step 5 — Azure DevOps CI Pipeline (YAML)**

Pipeline stages:

```
checkout → restore dependencies → build → unit test
docker build → docker push to ACR
publish build artifacts (optional)
```

Triggers only on `develop` / `feature/*` branches.

---

### **Step 6 — Azure DevOps CD Pipeline**

Pipeline stages:

```
terraform plan → approval → terraform apply
pull image from ACR → deploy to App Service/AKS
fetch secrets from Key Vault
run smoke tests
post-deployment validation
```

Automatic for Dev & QA, manual approval for Prod.

---

### **Step 7 — Cutover Simulation**

You will do:

```
Deploy v1 → test
Deploy v2 to staging slot → swap staging → production
Rollback slot if needed
```

---

### **Step 8 — Monitoring Setup**

Enable:

* App Insights for performance
* Log Analytics for logs
* Alerts for 500 errors, CPU, memory, response time

---

## 💯 If you practise this end-to-end, you will cover:

✔ On-Prem → Azure migration strategy
✔ IaC (Terraform)
✔ CI/CD (Azure DevOps YAML)
✔ Containerization (Docker + ACR)
✔ Key Vault & App Config
✔ Blue-Green & Zero downtime concepts
✔ Real enterprise infra model

---

## 🔥 Good news

This project can be practised with **public samples** (no company data).
I can provide:

🔻 sample .NET legacy application repo
🔻 Terraform module templates
🔻 Azure DevOps pipeline YAML
🔻 Sample cutover playbook (enterprise format)
