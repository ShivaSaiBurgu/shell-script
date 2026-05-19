#!/bin/bash
find /tmp/app-logs -name "*.log" -type f -mtime +14 -exec rm -f {} \;
