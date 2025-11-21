# Scripting — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. $@ vs $* in Bash?
A1. `$@` expands to separate quoted arguments; `$*` expands to all arguments as a single word (less safe).

Q2. What is trap in Bash?
A2. `trap` registers a command to run on signals or EXIT for cleanup.

Q3. How to check if variable is empty?
A3. Use `[ -z "$VAR" ]` to test if variable is empty.

Q4. Write script to check VM disk >80% and send alert.
A4. Typical approach: use `df` to get usage, compare and trigger mail/alert (implement in monitoring or cron).

Q5. Write PowerShell script to check memory and show unhealthy message.
A5. Use `Get-Counter` or `Get-WmiObject` to read memory metrics and write logic to output unhealthy when threshold exceeded.

Q6. Python: Search word in lines.
A6. Read file line-by-line and use `in` or `re` to match a pattern; print matching lines with line numbers.

