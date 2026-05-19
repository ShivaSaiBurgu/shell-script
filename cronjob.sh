#!/bin/bash

# Directory containing log files
LOG_DIR="/tmp/app-logs"

# Find and delete log files older than 14 days
find "$LOG_DIR" -type f -name "*.log" -mtime +14 -exec rm -f {} \;

echo "Old log files (older than 14 days) have been deleted from $LOG_DIR"

