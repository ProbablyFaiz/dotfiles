#!/usr/bin/env fish

set script_name (status filename)

if test (count $argv) -ne 4; or test "$argv[1]" = "-h"; or test "$argv[1]" = "--help"
    echo "Usage: $script_name <db_name> <backup_dir> <restic_repo> <local_retention_days>"
    echo "Example: $script_name mydb /path/to/backups restic:sftp:user@host:/backups 30"
    echo "Required env var: RESTIC_PASSWORD, RESTIC_PASSWORD_FILE, or RESTIC_PASSWORD_COMMAND"
    exit 1
end

if not set -q RESTIC_PASSWORD; and not set -q RESTIC_PASSWORD_FILE; and not set -q RESTIC_PASSWORD_COMMAND
    echo "Error: No restic password provided via environment variables"
    exit 1
end

set db_name $argv[1]
set backup_dir $argv[2]
set restic_repo $argv[3]
set local_retention_days $argv[4]
set timestamp (date +%Y%m%d_%H%M%S)
set dump_file "$backup_dir/$db_name"_"$timestamp.sql"

pg_dump -d $db_name -f $dump_file
restic -r $restic_repo backup --tag "pg_backup_$db_name" $dump_file

# Clean old local dumps
find $backup_dir -name "$db_name*.sql" -mtime +$local_retention_days -delete
