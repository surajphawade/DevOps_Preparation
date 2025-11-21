# Scripting – Persistent Systems Interview Questions

## Q1. Write a PowerShell script to check memory space >85% and show unhealthy message.
### Answer
Use Get-Counter or WMI object to check memory usage and compare percentage threshold.
### Follow-Up Points
- Use scheduled task for automation  
- Log output to file  
- Send alert/email if needed
### Example
$mem = Get-Counter '\Memory\% Committed Bytes In Use' | Select -ExpandProperty CounterSamples | Select -ExpandProperty CookedValue
if ($mem -gt 85) {
    Write-Host "Unhealthy: Memory usage above 85% ($mem%)"
} else {
    Write-Host "Healthy: Memory usage normal ($mem%)"
}

