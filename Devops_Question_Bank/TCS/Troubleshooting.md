# Troubleshooting – TCS

## Q1. If VM connectivity or deployment breaks during pipeline, what is your approach?
### Answer
Check pipeline logs → validate task failures → check infra status → check deployment strategy → fix credentials or service connection.
### Follow-Up Points
- Review NSG + DNS issues  
- Validate container image availability  
### Example
Failed AKS rollout → imagePullBackOff → fix image tag.

