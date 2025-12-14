#!/bin/bash

# Monitor system services

# List all running services
echo "=== Running Services ==="
systemctl list-units --type=service --state=running

# Check status of specific service
# Uncomment and modify to use:
# SERVICE_NAME="nginx"
# systemctl status "$SERVICE_NAME"

# Start a service (requires root)
# Uncomment and modify to use:
# systemctl start service_name

# Stop a service (requires root)
# Uncomment and modify to use:
# systemctl stop service_name

# Restart a service (requires root)
# Uncomment and modify to use:
# systemctl restart service_name

# Enable service to start on boot (requires root)
# Uncomment and modify to use:
# systemctl enable service_name

# Show failed services
echo -e "\n=== Failed Services ==="
systemctl list-units --type=service --state=failed
