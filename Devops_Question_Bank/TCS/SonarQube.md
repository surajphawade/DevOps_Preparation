# SonarQube – TCS

## Q1. How do you integrate SonarQube?
### Answer
Add SonarQube prepare + analyze tasks in pipeline, point to server, use token, enforce quality gates.
### Follow-Up Points
- Break build on critical issues  
- Use PR decoration  
### Example
SonarQubePrepare@5 → SonarQubeAnalyze@5.

---

## Q2. How do you check vulnerability in reports?
### Answer
Review issues tab → filter by severity → check hotspots → evaluate impacted code.
### Follow-Up Points
- Fix high/critical issues first  
- Re-run pipeline after fix  
### Example
Quality Gate → FAILED on Security Hotspots.

