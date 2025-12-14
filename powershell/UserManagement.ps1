# User management script

# List all local users
Write-Host "=== All Local Users ===" -ForegroundColor Green
Get-LocalUser | Select-Object Name, Enabled, LastLogon

# List all local groups
Write-Host "`n=== All Local Groups ===" -ForegroundColor Green
Get-LocalGroup | Select-Object Name, Description

# Show members of Administrators group
Write-Host "`n=== Administrators Group Members ===" -ForegroundColor Green
Get-LocalGroupMember -Group "Administrators"

# Create a new local user (requires admin)
# Uncomment and modify to use:
# $Password = Read-Host -AsSecureString "Enter password"
# New-LocalUser -Name "username" -Password $Password -FullName "Full Name" -Description "Description"

# Delete a local user (requires admin)
# Uncomment and modify to use:
# Remove-LocalUser -Name "username"

# Add user to group (requires admin)
# Uncomment and modify to use:
# Add-LocalGroupMember -Group "Administrators" -Member "username"

# Remove user from group (requires admin)
# Uncomment and modify to use:
# Remove-LocalGroupMember -Group "Administrators" -Member "username"

# Change user password (requires admin)
# Uncomment and modify to use:
# $Password = Read-Host -AsSecureString "Enter new password"
# Set-LocalUser -Name "username" -Password $Password
