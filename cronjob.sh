#!/bin/bash
find /path/to/search -name "*.log" -type f -mtime +14 -exec rm -f {} \;
