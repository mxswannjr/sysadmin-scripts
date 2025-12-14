# Display system information

# Show computer name
Write-Host "=== Computer Name ===" -ForegroundColor Green
$env:COMPUTERNAME

# Show OS information
Write-Host "`n=== OS Information ===" -ForegroundColor Green
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture

# Show CPU information
Write-Host "`n=== CPU Information ===" -ForegroundColor Green
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors

# Show memory information
Write-Host "`n=== Memory Information ===" -ForegroundColor Green
$memory = Get-CimInstance Win32_ComputerSystem
$totalMemoryGB = [math]::Round($memory.TotalPhysicalMemory / 1GB, 2)
Write-Host "Total Physical Memory: $totalMemoryGB GB"

# Show disk information
Write-Host "`n=== Disk Information ===" -ForegroundColor Green
Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null } | Select-Object Name, @{Name="Used(GB)";Expression={[math]::Round($_.Used/1GB,2)}}, @{Name="Free(GB)";Expression={[math]::Round($_.Free/1GB,2)}}

# Show network adapters
Write-Host "`n=== Network Adapters ===" -ForegroundColor Green
Get-NetAdapter | Select-Object Name, Status, LinkSpeed

# Show system uptime
Write-Host "`n=== System Uptime ===" -ForegroundColor Green
$uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
Write-Host "Days: $($uptime.Days), Hours: $($uptime.Hours), Minutes: $($uptime.Minutes)"
