# Azure SQL / Database – Optum

## Q1. Azure SQL vs On-prem SQL?
### Answer
Azure SQL = managed PaaS database; on-prem needs full admin, patching, backups.
### Follow-Up Points
- Built-in autoscaling  
- No server maintenance  
### Example
Automatic backups + geo-redundancy.

---

## Q2. How do you connect SQL DB with application?
### Answer
Using connection strings stored in Key Vault or configuration settings.
### Follow-Up Points
- Use private endpoint  
### Example
App → Managed Identity → Key Vault.

---

## Q3. If DB deleted, how to recover?
### Answer
Point-in-time restore or geo-restore.
### Follow-Up Points
- PITR for 7–35 days  
### Example
Restore to new server.

