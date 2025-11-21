# Scripting – HCL Interview Questions

## Q1. Have you worked on PowerShell?
### Answer
Yes, PowerShell is used for automating tasks on Windows systems—checking system health, managing resources, executing Azure CLI/REST commands, and writing automation scripts.
### Follow-Up Points
- Use modules like Az module  
- Supports object-based output  
- Good for Azure automation
### Example
Get-Process | Sort-Object CPU -Descending

---

## Q2. Have you worked on Bash?
### Answer
Yes, Bash is used for Linux automation tasks, writing CI/CD scripts, validating variables, monitoring system resources, and integrating with Terraform/Azure CLI.
### Follow-Up Points
- Often used in pipelines  
- Good for file/text operations  
- Supports traps, arrays, functions
### Example
#!/bin/bash  
echo "Deploying infrastructure..."

---

## Q3. Difference between $@ and $* ?
### Answer
`$@` treats quoted arguments as separate;  
`$*` treats all arguments as one big string.
### Follow-Up Points
- `$@` is safer in loops  
- `$*` collapses arguments  
- Important in script parameter handling
### Example
for arg in "$@"; do echo $arg; done

---

## Q4. How to check if variable has non-empty value?
### Answer
Use `-n` or double brackets to check if the variable contains a value.
### Follow-Up Points
- Validate input variables in scripts  
- Prevent runtime failures
### Example
if [[ -n "$VAR" ]]; then echo "not empty"; fi

---

## Q5. What is trap in bash?
### Answer
`trap` is used to catch signals (exit, interrupt, errors) and run commands before the script stops.
### Follow-Up Points
- Used for cleanup  
- Catch SIGINT, SIGTERM  
- Improves reliability of long scripts
### Example
trap "echo 'Cleaning up...'; rm -f temp.txt" EXIT

