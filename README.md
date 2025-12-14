# DevForge Sysadmin Scripts

A comprehensive collection of system administration scripts for Linux/Unix (Bash) and Windows (PowerShell) environments, following enterprise-grade security and operational best practices.

## 🎯 **Mission Context**

These scripts are developed by **DevForge Agent** - an elite AI development partner focused on building projects that advance towards CISO/CTO roles. Each script emphasizes security hardening, compliance awareness, and technical leadership.

## 📁 **Repository Structure**

```
sysadmin-scripts/
├── bash/           # Linux/Unix shell scripts
└── powershell/     # Windows PowerShell scripts
```

## Bash Scripts (Linux/Unix)

### system_info.sh
Displays comprehensive system information including hostname, OS details, CPU, memory, disk usage, and uptime.

**Usage:**
```bash
chmod +x bash/system_info.sh
./bash/system_info.sh
```

### user_management.sh
Manages user accounts - lists users, shows login information, and provides commands for creating/deleting users.

**Usage:**
```bash
chmod +x bash/user_management.sh
sudo ./bash/user_management.sh
```

### backup.sh
Creates compressed backups of directories and automatically removes old backups.

**Usage:**
```bash
chmod +x bash/backup.sh
# Edit SOURCE_DIR and BACKUP_DIR variables first
sudo ./bash/backup.sh
```

### service_monitor.sh
Monitors system services, shows running and failed services.

**Usage:**
```bash
chmod +x bash/service_monitor.sh
./bash/service_monitor.sh
```

### log_analyzer.sh
Analyzes system logs for errors, authentication attempts, and disk issues.

**Usage:**
```bash
chmod +x bash/log_analyzer.sh
sudo ./bash/log_analyzer.sh
```

## PowerShell Scripts (Windows)

### SystemInfo.ps1
Displays comprehensive system information including computer name, OS, CPU, memory, disk, and network details.

**Usage:**
```powershell
.\powershell\SystemInfo.ps1
```

### UserManagement.ps1
Manages local user accounts and groups.

**Usage (requires admin):**
```powershell
.\powershell\UserManagement.ps1
```

### Backup.ps1
Creates compressed ZIP backups of directories and removes old backups.

**Usage:**
```powershell
# Edit $SourceDir and $BackupDir variables first
.\powershell\Backup.ps1
```

### ServiceMonitor.ps1
Monitors Windows services and shows running, stopped, and failed services.

**Usage:**
```powershell
.\powershell\ServiceMonitor.ps1
```

### LogAnalyzer.ps1
Analyzes Windows Event Logs for errors, warnings, and security events.

**Usage (requires admin):**
```powershell
.\powershell\LogAnalyzer.ps1
```

## Notes

- Bash scripts require execute permissions: `chmod +x script.sh`
- Many operations require root/administrator privileges
- Edit configuration variables in scripts before first use
- Test scripts in a safe environment before production use
