#!/bin/bash

# Create backup filename with timestamp
BACKUP_DATE=$(date +%Y-%m-%d_%H%M%S)
BACKUP_NAME="foundry_backup_$BACKUP_DATE.tar.gz"
BACKUP_DIR_TARGET="/data/container-backups"  # Change this to your preferred backup location
BACKUP_DIR_SOURCE="/data/container-configs/foundryvtt"  # Source directory to backup

# Make sure backup directory exists
mkdir -p $BACKUP_DIR_TARGET

# Create the backup
echo "Creating backup of Foundry VTT data..."
sudo tar -czf "$BACKUP_DIR_TARGET/$BACKUP_NAME" $BACKUP_DIR_SOURCE

# Set appropriate permissions
sudo chmod 600 "$BACKUP_DIR_TARGET/$BACKUP_NAME"

# Output results
echo "Backup completed: $BACKUP_DIR_TARGET/$BACKUP_NAME"
echo "Backup size: $(du -h "$BACKUP_DIR_TARGET/$BACKUP_NAME" | cut -f1)"