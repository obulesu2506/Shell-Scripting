#!/bin/bash

backup_dir = "/tmp/backup"
source_dir = "/var/log/messages"

#Create backup file with timestamp
tar -czf "$backup_dir/backup_$(date +%Y%m%d-%H%M%S).tar.gz" "$source_dir"


