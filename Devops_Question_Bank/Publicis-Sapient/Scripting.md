# Scripting – Publicis Sapient Interview Questions

## Q1. Shell script: alert if disk > 80%
### Answer
Check disk usage and send email when threshold is crossed.
### Follow-Up Points
- Use cron for scheduling  
- Use mail or sendmail  
### Example
#!/bin/bash
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if (( usage > 80 )); then
  echo "Disk above 80%" | mail -s "Alert" admin@example.com
fi

