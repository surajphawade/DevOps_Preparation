# CI/CD – Publicis Sapient Interview Questions

## Q1. Condition: run pipeline only when dev passes 90%
### Answer
Use a conditional check in YAML based on code coverage or test results.
### Follow-Up Points
- Use variables from test stage  
- Use `condition:` in ADO YAML  
### Example
condition: and(succeeded(), eq(variables['coverage'], '90'))

