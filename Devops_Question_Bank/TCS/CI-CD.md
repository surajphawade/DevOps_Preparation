# CI/CD – TCS

## Q1. What is your CI/CD flow?
### Answer
Code → Build → Test → Scan (SAST/DAST) → Deploy → Validate → Monitor → Release.
### Follow-Up Points
- Multi-stage YAML  
- Approval workflows  
### Example
Dev → QA → UAT → Prod stages.

---

## Q2. How do you ensure pipeline quality and checks?
### Answer
Use linting, unit tests, code coverage, SonarQube, security scans, branch policies, and quality gates.
### Follow-Up Points
- Enforce PR approvals  
- Mandatory SAST/DAST  
### Example
pipeline fails if coverage < threshold.

