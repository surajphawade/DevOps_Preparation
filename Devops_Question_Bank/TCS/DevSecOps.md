# DevSecOps / Security – TCS

## Q1. What is SAST and DAST?
### Answer
SAST analyzes source code for vulnerabilities before runtime.  
DAST tests running applications from the outside to find security issues.
### Follow-Up Points
- SAST = early detection  
- DAST = runtime vulnerabilities  
### Example
SAST = SonarQube, Checkmarx  
DAST = OWASP ZAP.

---

## Q2. DevSecOps best practices you implemented?
### Answer
Security scanning, dependency checks, secret scanning, signing artifacts, RBAC, minimum privileges, policy-based pipelines.
### Follow-Up Points
- Automate all gates  
- Integrate security early  
### Example
Include SAST + DAST + dependency scan in pipeline.

---

## Q3. Developer pushing vulnerable code — how do you manage it?
### Answer
Use PR checks, SonarQube gates, blocked merges, automated vulnerability scanning, and approval workflows.
### Follow-Up Points
- Enforce mandatory code review  
- Fail pipeline on critical issues  
### Example
Quality Gate in SonarQube → Block merge.

