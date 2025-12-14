#!/bin/bash

# Analyze system logs

# Show recent system log entries
echo "=== Recent System Logs (last 50 lines) ==="
journalctl -n 50 --no-pager

# Show kernel messages
echo -e "\n=== Kernel Messages ==="
dmesg | tail -20

# Show authentication logs
echo -e "\n=== Recent Authentication Attempts ==="
grep "authentication failure" /var/log/auth.log 2>/dev/null | tail -10 || echo "No auth.log found"

# Show SSH login attempts
echo -e "\n=== SSH Login Attempts ==="
grep "sshd" /var/log/auth.log 2>/dev/null | tail -10 || echo "No SSH logs found"

# Show disk errors
echo -e "\n=== Disk Errors ==="
dmesg | grep -i "error\|fail" | grep -i "disk\|sda\|sdb" | tail -10

# Show system errors from journal
echo -e "\n=== System Errors (last 20) ==="
journalctl -p err -n 20 --no-pager
