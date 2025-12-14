#!/bin/bash

# Backup script for directories

# Set backup source and destination
SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${DATE}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create compressed backup archive
echo "Creating backup: $BACKUP_NAME"
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" "$SOURCE_DIR"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: ${BACKUP_DIR}/${BACKUP_NAME}"
else
    echo "Backup failed!"
    exit 1
fi

# Remove backups older than 30 days
echo "Removing backups older than 30 days..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +30 -delete

# Show remaining backups
echo -e "\n=== Current Backups ==="
ls -lh "$BACKUP_DIR"
