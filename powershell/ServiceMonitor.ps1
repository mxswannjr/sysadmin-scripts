# Monitor Windows services

# List all running services
Write-Host "=== Running Services ===" -ForegroundColor Green
Get-Service | Where-Object { $_.Status -eq "Running" } | Select-Object Name, DisplayName, Status | Format-Table -AutoSize

# List all stopped services
Write-Host "`n=== Stopped Services ===" -ForegroundColor Yellow
Get-Service | Where-Object { $_.Status -eq "Stopped" } | Select-Object Name, DisplayName, Status | Format-Table -AutoSize

# Check status of specific service
# Uncomment and modify to use:
# $ServiceName = "wuauserv"
# Get-Service -Name $ServiceName | Select-Object Name, DisplayName, Status, StartType

# Start a service (requires admin)
# Uncomment and modify to use:
# Start-Service -Name "ServiceName"

# Stop a service (requires admin)
# Uncomment and modify to use:
# Stop-Service -Name "ServiceName"

# Restart a service (requires admin)
# Uncomment and modify to use:
# Restart-Service -Name "ServiceName"

# Set service to start automatically (requires admin)
# Uncomment and modify to use:
# Set-Service -Name "ServiceName" -StartupType Automatic

# Show services that failed to start
Write-Host "`n=== Services with Issues ===" -ForegroundColor Red
Get-EventLog -LogName System -Source "Service Control Manager" -EntryType Error -Newest 10 | Select-Object TimeGenerated, Message
