# 🐚 Bash Scripting Journey

## Overview
This repository documents a hands-on journey into Bash scripting and Linux command-line fundamentals. It contains a collection of progressively structured scripts that demonstrate concepts from basic syntax and variables to loops, functions, file handling, and system automation.

The materials are organized as a self-paced learning curriculum suitable for beginners and intermediate learners interested in automation, DevOps workflows, and system administration.

---

## Repository structure (suggested)

- projects/        — Practical scripts and automations  
- scripts/         — Individual example scripts and exercises  
- test/            — Sample files used by scripts (e.g., `test.csv`)  
- all_files/       — Example output files and listings  
- README.md        — This file

---

## Contents
Each script focuses on a specific concept or use case. Topics covered include:

- Basic syntax & variables (echo, variables, user input)  
- Arrays & strings (indexed and associative arrays, string manipulation)  
- Arithmetic & conditionals (arithmetic operations, `if` statements)  
- Loops (`for`, `while`, `until`, `break`, `continue`)  
- Case statements & logical operators (`case`, `&&`, `||`)  
- File handling (read, write, check, manipulate files)  
- Functions & arguments (creating reusable functions)  
- User & system checks (root validation, connectivity tests)  
- Logging & debugging (`logger`, `set -x`, error handling)  
- Background execution (`nohup`, output redirection)

---

## Projects (examples)
Below are three example automation projects included (or easy to add) in this repository. Each includes a description, the core script, and setup notes.

### Project 1 — Monitor free memory and alert
Purpose: Monitor available RAM and print an alert when memory drops below a threshold.

```bash
#!/usr/bin/env bash
# monitor_memory.sh
THRESHOLD_MB=500
FREE_MB=$(free -m | awk '/Mem:/ {print $7}')

if [[ -z "$FREE_MB" ]]; then
  echo "Unable to determine available memory"
  exit 1
fi

if (( FREE_MB < THRESHOLD_MB )); then
  echo "⚠️ WARNING: RAM is running low — ${FREE_MB} MB available"
else
  echo "✅ RAM sufficient — ${FREE_MB} MB available"
fi
```

Use case: Run via cron to periodically check memory on servers.

---

### Project 2 — Monitor disk space and send alert email
Purpose: Check free disk percentage for a filesystem and email an alert if it falls below a threshold.

```bash
#!/usr/bin/env bash
# disk_monitor.sh
THRESHOLD=20
TO="your_email@example.com"
SUBJECT="Disk Space Alert on $(hostname)"
FILESYSTEM="/"

# Get available percentage (100 - used%)
FREE_PCT=$(df -P "$FILESYSTEM" | awk 'NR==2 {gsub("%","", $5); print 100 - $5}')

if [[ -z "$FREE_PCT" ]]; then
  echo "Unable to determine disk usage for $FILESYSTEM"
  exit 1
fi

if (( FREE_PCT < THRESHOLD )); then
  MESSAGE="⚠️ Warning: Only ${FREE_PCT}% disk space left on ${FILESYSTEM} of $(hostname)"
  echo "$MESSAGE" | mail -s "$SUBJECT" "$TO"
fi
```

Setup notes:
- Install mailutils (Debian/Ubuntu): `sudo apt update && sudo apt install -y mailutils`  
- Make executable and add to cron: `chmod +x disk_monitor.sh` and add a cron entry like `*/10 * * * * /path/to/disk_monitor.sh`

---

### Project 3 — Archive older or larger files
Purpose: Compress and move files that are larger than a given size or older than N days into an archive folder.

```bash
#!/usr/bin/env bash
# archive_files.sh
DIR="/path/to/target"
ARCHIVE="$DIR/archive"
MIN_SIZE="20M"    # files larger than this
MAX_AGE_DAYS=10   # files older than this

if [[ ! -d "$DIR" ]]; then
  echo "Directory $DIR does not exist"
  exit 1
fi

mkdir -p "$ARCHIVE"

# Find and compress large files
find "$DIR" -maxdepth 1 -type f -size +${MIN_SIZE} -print0 \
  | xargs -0 -I{} bash -lc 'gzip -c "{}" > "${1}/$(basename "{}").gz"' -- "$ARCHIVE"

# Find and compress old files
find "$DIR" -maxdepth 1 -type f -mtime +${MAX_AGE_DAYS} -print0 \
  | xargs -0 -I{} bash -lc 'gzip -c "{}" > "${1}/$(basename "{}").gz"' -- "$ARCHIVE"
```

Cron example: `0 1 * * * /path/to/archive_files.sh` — run daily at 01:00.

---

## Tools & commands used
- Core: `free`, `df`, `ls`, `pwd`, `cd`, `mkdir`, `rm`, `mv`, `cp`  
- Text processing: `awk`, `grep`, `find`, `xargs`, `tar`, `gzip`  
- System & automation: `mail`, `logger`, `crontab`, `nohup`  
- Bash constructs: `if`, `case`, `for`, `while`, `until`, functions, arguments, `shift`, `exit`, `set -x`, `set -e`

---

## How to run scripts

Make a script executable:

```bash
chmod +x script_name.sh
```

Run directly:

```bash
./script_name.sh
# or
bash script_name.sh
```

---

## Logging & debugging tips
- Use `logger "message"` to add system log entries.  
- Enable execution tracing during debugging: `set -x`.  
- Exit on first error during a script: `set -e`.  
- Redirect output using `>` or `>>`; use `/dev/null` to discard output.

---

## Author
Samuel — learning Bash scripting via hands-on automation and system-level tasks.

## License
MIT
