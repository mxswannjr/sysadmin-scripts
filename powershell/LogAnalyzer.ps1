# Analyze Windows event logs

# Show recent system errors
Write-Host "=== Recent System Errors (last 20) ===" -ForegroundColor Red
Get-EventLog -LogName System -EntryType Error -Newest 20 | Select-Object TimeGenerated, Source, Message | Format-Table -AutoSize

# Show recent application errors
Write-Host "`n=== Recent Application Errors (last 20) ===" -ForegroundColor Red
Get-EventLog -LogName Application -EntryType Error -Newest 20 | Select-Object TimeGenerated, Source, Message | Format-Table -AutoSize

# Show recent security events
Write-Host "`n=== Recent Security Events (last 20) ===" -ForegroundColor Yellow
Get-EventLog -LogName Security -Newest 20 | Select-Object TimeGenerated, EntryType, Source, Message | Format-Table -AutoSize

# Show failed login attempts
Write-Host "`n=== Failed Login Attempts ===" -ForegroundColor Red
Get-EventLog -LogName Security | Where-Object { $_.EventID -eq 4625 } | Select-Object TimeGenerated, Message -First 10

# Show successful login attempts
Write-Host "`n=== Successful Login Attempts ===" -ForegroundColor Green
Get-EventLog -LogName Security | Where-Object { $_.EventID -eq 4624 } | Select-Object TimeGenerated, Message -First 10

# Show system warnings
Write-Host "`n=== Recent System Warnings (last 20) ===" -ForegroundColor Yellow
Get-EventLog -LogName System -EntryType Warning -Newest 20 | Select-Object TimeGenerated, Source, Message | Format-Table -AutoSize

# Show disk-related errors
Write-Host "`n=== Disk-Related Errors ===" -ForegroundColor Red
Get-EventLog -LogName System | Where-Object { $_.Source -like "*disk*" -and $_.EntryType -eq "Error" } | Select-Object TimeGenerated, Source, Message -First 10
