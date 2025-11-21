# Scripting – Capgemini Interview Questions

## Q1. Python: Search a word in multiple lines of a file.
### Answer
Use a simple loop to read each line and check if the word exists in that line.
### Follow-Up Points
- Useful for log analysis  
- Can be extended using regex  
- Efficient for large files when streamed line-by-line
### Example
with open("log.txt") as f:
    for line in f:
        if "error" in line:
            print(line.strip())

---

## Q2. Shell script: If VM disk usage >80%, send alert.
### Answer
Use `df -h` to get disk usage and send an email or print alert if usage exceeds threshold.
### Follow-Up Points
- Use cron for periodic checks  
- Can integrate with monitoring tools  
- Use logrotate to prevent log growth
### Example
usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$usage" -gt 80 ]; then
  echo "Disk above 80%" | mail -s "Disk Alert" admin@example.com
fi
