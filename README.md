# 🐚 Bash Scripting Journey – README

## 📁 Overview
This repository documents my **hands-on journey into Bash scripting** and **Linux command-line fundamentals**.  
It includes a series of **36+ progressively structured `.sh` files**, each demonstrating key concepts — from **basic syntax and variables** to **loops**, **functions**, **file handling**, and **system automation**.

The folder is designed as a **self-paced learning curriculum**, ideal for **beginners** and **intermediate learners** aiming to master **Bash scripting** for:
- Automation
- DevOps workflows
- System administration

---

## 📚 Contents
Each script corresponds to a specific concept or use case. Examples include:

| **Topic**                     | **Description**                                                                |
|--------------------------------|--------------------------------------------------------------------------------|
| Basic Syntax & Variables       | Echo, variables, constants, user input                                        |
| Arrays & Strings               | Indexed and associative arrays, string manipulation                          |
| Arithmetic & Conditions        | Arithmetic operations, `if` statements, comparison operators                  |
| Loops                          | `for`, `while`, `until` loops and control flow with `break` and `continue`   |
| Case Statements & Logical Ops  | `case` structure, `&&`, `||` usage                                            |
| File Handling                  | Read, write, check, and manipulate files                                     |
| Functions & Arguments          | Creating reusable functions with parameters                                  |
| User & System Checks           | Root user validation, connectivity testing                                  |
| Logging & Debugging            | Using `logger`, enabling `set -x`, error handling                             |
| Background Execution           | Running scripts using `nohup` and redirecting outputs                         |

**Additional Folders**:
- `test/` – Sample files like `test.csv` for file reading demos.  
- `all_files/` – Used for output redirection and file listing.  
- `nohup.out` – Captures output from background scripts.

---

# 🚀 Projects (Main Section)

These are **real-world automation scripts** built using Bash.  
Each project demonstrates how scripting can solve practical system-level problems.

---

## 🧠 **Project 1: Monitor Free Memory and Alert**

**Purpose**:  
Monitor available RAM and alert the user if memory drops below a defined threshold.

**Script Logic**:
- Uses `free -mt` to check total memory.
- Extracts available memory using `awk`.
- Compares it against a threshold (e.g., 500MB).
- Prints a warning if memory is low.

''' bash '''
#!/bin/bash
FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
TH=500

if [[ $FREE_SPACE -lt $TH ]]; then
  echo "⚠️ WARNING: RAM is running low"
else
  echo "✅ RAM Space is sufficient - $FREE_SPACE MB"
fi
#### Use Case:
Ideal for servers or systems where memory usage needs to be monitored periodically.

## 💽 Project 2: Monitor Disk Space and Send Alert Email
Purpose:
Monitor disk usage and send an alert email if free space falls below a threshold.

Script Logic:

Uses df -h to get disk usage.

Calculates free space percentage.

Sends an alert email using mail if space is below threshold.

Setup Instructions:
nano disk_monitor.sh
chmod +x disk_monitor.sh
sudo apt update
sudo apt install mailutils -y
./disk_monitor.sh
crontab -e
*/10 * * * * /path/to/disk_monitor.sh
Sample Code:

#!/bin/bash
THRESHOLD=20
TO="your_email@example.com"
SUBJECT="Disk Space Alert on $(hostname)"
FILESYSTEM="/"

FREE_SPACE=$(df -h "$FILESYSTEM" | awk 'NR==2 {gsub("%",""); print 100 - $5}')

if [ "$FREE_SPACE" -lt "$THRESHOLD" ]; then
  MESSAGE="⚠️ Warning: Only $FREE_SPACE% disk space left on $FILESYSTEM of $(hostname)"
  echo "$MESSAGE" | mail -s "$SUBJECT" "$TO"
fi
Use Case:
Perfect for production environments where disk space needs constant monitoring.

## 📦 Project 3: Archive Older or Larger Files
Purpose:
Automatically compress and archive files that are either:

Larger than a specified size (e.g., 20MB), or

Older than a specified number of days (e.g., 10 days)

Script Logic:

Accepts a directory path.

Checks if the directory exists.

Creates an archive/ folder if not present.

Finds files using find with -size and -mtime.

Compresses files using gzip.

Moves them to the archive folder.

Can be scheduled via cron for daily execution.

bash
Copy code
#!/bin/bash
DIR="/path/to/target"
ARCHIVE="$DIR/archive"

# Create archive folder if not exists
mkdir -p "$ARCHIVE"

# Find and compress large files
find "$DIR" -type f -size +20M -exec gzip {} \; -exec mv {}.gz "$ARCHIVE" \;

# Find and compress old files
find "$DIR" -type f -mtime +10 -exec gzip {} \; -exec mv {}.gz "$ARCHIVE" \;
Cron Setup:

bash
Copy code
crontab -e
0 1 * * * /path/to/archive_script.sh
Use Case:
Ideal for log rotation, backup automation, or cleaning up large datasets.

🛠️ Tools & Commands Used
Core Commands: free, df, ls, pwd, cd, mkdir, rm, mv, cp

Text Processing: awk, grep, find, tar, gzip

System & Automation: mail, logger, crontab, nohup

Bash Constructs: if, case, for, while, until, functions, arguments, shift, exit, set -x, set -e

📌 How to Run Scripts
bash
Copy code
# Make executable
chmod +x script_name.sh

# Run directly
./script_name.sh

# Or use
bash script_name.sh
📎 Logging & Debugging
Use logger "message" to log system events.

Enable debugging with set -x.

Exit on error with set -e.

🧩 Automation Tips
Use nohup to run long scripts in the background.

Redirect output to files using > or >>.

Use /dev/null to suppress unwanted output.

🧑‍💻 Author
Samuel
Learning Bash scripting through hands-on automation projects and system-level problem solving.

🏁 License
This project is open-source and available under the MIT License.

pgsql
Copy code

---

✅ This is in perfect **GitHub README format** — with sections, code blocks, tables, and headings properly structured.  
✅ You can **copy and paste** this into `README.md` and push it directly.  
✅ Once you add your project scripts into a `projects/` folder, you can link them easily under the “Projects” section.  

Would you like me to also add a small **repository structure tree** (like `tree` view) at the top of
