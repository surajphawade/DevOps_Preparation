# Python / Scripting – TechRBM Interview Questions

## Q1. Python: Search word in lines.
### Answer
Use a simple script to open a file and iterate through lines to find matches; use regex for patterns.
### Follow-Up Points
- Use streaming for large files.  
- Use compiled regex for repeated searches.
### Example (python)
#!/usr/bin/env python3
import sys, re

pattern = re.compile(r'error', re.IGNORECASE)
with open(sys.argv[1], 'r') as f:
    for lineno, line in enumerate(f, 1):
        if pattern.search(line):
            print(f"{lineno}: {line.rstrip()}")

