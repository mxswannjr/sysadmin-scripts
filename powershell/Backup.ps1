# Backup script for directories

# Set backup source and destination
$SourceDir = "C:\Path\To\Source"
$BackupDir = "C:\Path\To\Backup"
$Date = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupName = "backup_$Date.zip"
$BackupPath = Join-Path $BackupDir $BackupName

# Create backup directory if it doesn't exist
if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
    Write-Host "Created backup directory: $BackupDir" -ForegroundColor Green
}

# Create compressed backup archive
Write-Host "Creating backup: $BackupName" -ForegroundColor Yellow
try {
    Compress-Archive -Path $SourceDir -DestinationPath $BackupPath -CompressionLevel Optimal
    Write-Host "Backup completed successfully: $BackupPath" -ForegroundColor Green
} catch {
    Write-Host "Backup failed: $_" -ForegroundColor Red
    exit 1
}

# Remove backups older than 30 days
Write-Host "`nRemoving backups older than 30 days..." -ForegroundColor Yellow
$OldBackups = Get-ChildItem -Path $BackupDir -Filter "backup_*.zip" | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }
$OldBackups | ForEach-Object {
    Remove-Item $_.FullName -Force
    Write-Host "Removed: $($_.Name)" -ForegroundColor Gray
}

# Show remaining backups
Write-Host "`n=== Current Backups ===" -ForegroundColor Green
Get-ChildItem -Path $BackupDir -Filter "backup_*.zip" | Select-Object Name, @{Name="Size(MB)";Expression={[math]::Round($_.Length/1MB,2)}}, LastWriteTime
