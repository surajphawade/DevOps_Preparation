# Azure App Services – TechRBM Interview Questions

## Q1. What are App Services in Azure Cloud?
### Answer
Azure App Service is a PaaS offering to host web apps, APIs, and mobile backends. It manages OS, scaling, load balancing, and patches so you focus on code.
### Follow-Up Points
- Supports multiple runtimes (Node, .NET, Python).  
- Features: deployment slots, custom domains, TLS, auto-scale, diagnostics.
### Example
Create a Web App and deploy via ZIP deploy or CI pipeline.

---

## Q2. How would you use Azure App Service to deploy an application?
### Answer
Package app (or build artifact), create App Service plan and Web App, configure app settings and connection strings (point to Key Vault), then deploy using Azure DevOps/GitHub Actions (zip or container). Use deployment slots for staging → swap to prod.
### Follow-Up Points
- Use Managed Identity to access resources.  
- Use deployment slots for zero-downtime swaps.  
- Integrate App Insights for telemetry.
### Example
az webapp create --name myapp --plan myPlan --resource-group rg
az webapp deploy --resource-group rg --name myapp --src-path ./app.zip

