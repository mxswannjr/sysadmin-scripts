#!/bin/bash

# User management script

# List all users
echo "=== All Users ==="
cat /etc/passwd | cut -d: -f1

# List users with login shells
echo -e "\n=== Users with Login Shells ==="
grep -v "/nologin\|/false" /etc/passwd | cut -d: -f1

# Show currently logged in users
echo -e "\n=== Currently Logged In Users ==="
who

# Show last login information
echo -e "\n=== Last Login Information ==="
lastlog | head -20

# Create a new user (requires root)
# Uncomment and modify to use:
# useradd -m -s /bin/bash username

# Delete a user (requires root)
# Uncomment and modify to use:
# userdel -r username

# Change user password (requires root)
# Uncomment and modify to use:
# passwd username
