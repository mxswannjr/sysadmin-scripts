#!/bin/bash

# Display system information

# Show hostname
echo "=== Hostname ==="
hostname

# Show OS information
echo -e "\n=== OS Information ==="
cat /etc/os-release

# Show kernel version
echo -e "\n=== Kernel Version ==="
uname -r

# Show CPU information
echo -e "\n=== CPU Information ==="
lscpu | grep "Model name"

# Show memory usage
echo -e "\n=== Memory Usage ==="
free -h

# Show disk usage
echo -e "\n=== Disk Usage ==="
df -h

# Show uptime
echo -e "\n=== System Uptime ==="
uptime
