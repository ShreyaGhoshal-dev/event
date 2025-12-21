# Event Portal - LAN Hosting Guide

This is a PHP & PostgreSQL web application designed to be hosted on a local server for an event. Participants connect via LAN to solve puzzles and submit answers.

## 📋 Prerequisites

Ensure your server PC (Linux/Ubuntu recommended) has the following installed:
* **PHP** (with PostgreSQL extension)
* **PostgreSQL**
* **Git** (optional, for cloning)

```bash
# Ubuntu/Debian installation example:
sudo apt update
sudo apt install php php-pgsql postgresql postgresql-contrib
```

## ⚙️ 1. Database Setup

Before starting the server, set up the database and tables.

1. **Start PostgreSQL service:**
```bash
sudo service postgresql start
```

2. **Create the Database & Import Tables:**
Run these from the project root:
```bash
# Create the main database
sudo -u postgres createdb users

# Import the table structures
sudo -u postgres psql -d users -f databases/users.sql

# Optional: Import level data if needed
# sudo -u postgres psql -d users -f databases/level_1.sql
# sudo -u postgres psql -d users -f databases/level_2.sql
# sudo -u postgres psql -d users -f databases/final_lvl1.sql
# sudo -u postgres psql -d users -f databases/final_lvl2.sql
```

3. **Ensure the time column exists (for leaderboard):**
```bash
sudo -u postgres psql -d users -c "ALTER TABLE users ADD COLUMN IF NOT EXISTS time TIMESTAMP;"
```

## 🚀 2. Hosting on LAN

To allow other computers to connect, bind the PHP server to `0.0.0.0`.

1. **Find your Local IP Address:**
```bash
hostname -I
```
Use the first IP (e.g., `192.168.1.15`).

2. **Start the Server:**
From the project root:
```bash
php -S 0.0.0.0:9000 -t public
```

3. **Connect from Client PCs:**
Clients open:
```
http://<SERVER_IP>:9000
```
Example: `http://192.168.1.15:9000`

Troubleshooting: If clients cannot connect, open port 9000:
```bash
sudo ufw allow 9000/tcp
```

## 🎮 3. Game Management (Host Guide)

Control the event using `public/status.txt`.

### Status values
| Value   | Effect |
|--------:|--------|
| `1`     | Start Level 1 |
| `2`     | Start Level 2 |
| `3`     | Final Level 1 |
| `4`     | Final Level 2 |
| `5`     | Leaderboard (Top 5 fastest) |
| `reset` | Wipe data (clears users table) |
| `0`     | Pause (Please wait screen) |

### Typical workflow
1. Set `status.txt` to `1`. (Start)
2. When ready to show winners, set `status.txt` to `5`.
3. Backup data.
4. Set `status.txt` to `reset` to clear DB.
5. Set `status.txt` to next round value (e.g., `2`).

## 💾 Backup & Restore

### Quick backup (manual)
```bash
# Run as postgres user
sudo -u postgres pg_dump users > backups/users_backup_$(date +%F_%H-%M-%S).sql
```

### Restore into a new DB (safe)
```bash
# create a new db and restore into it
sudo -u postgres createdb old_round_data
sudo -u postgres psql -d old_round_data -f backups/users_backup_2025-12-21_21-45-00.sql
```

### Automated backup script (optional)
Create `backup.sh` in project root:
```bash
#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p backups
sudo -u postgres pg_dump users > backups/users_backup_$TIMESTAMP.sql
echo "Backup saved to backups/users_backup_$TIMESTAMP.sql"
```
Make it executable:
```bash
chmod +x backup.sh
```
Run `./backup.sh` before setting `status.txt` to `reset`.

## 🧰 Useful Commands

- Start server:
```bash
php -S 0.0.0.0:9000 -t public
```
- Dump DB as postgres user (no password prompt):
```bash
sudo -u postgres pg_dump users > users.sql
```
- Truncate users table (clears data, resets IDs):
```bash
sudo -u postgres psql -d users -c "TRUNCATE TABLE users RESTART IDENTITY;"
```

## 🔐 Notes & Recommendations

* Always backup (`pg_dump`) before clearing data.
* Use `status.txt` to centrally control participant views.
* Keep `reset` action deliberate — anyone refreshing after `reset` will trigger the clear if your code is set to auto-truncate; consider restricting reset to host-only if preferred.
* For production or larger events, consider a proper webserver (Nginx/Apache + PHP-FPM) and HTTPS.

## ✅ Ready to Host

1. Ensure DB is set up.
2. Set `public/status.txt` to `1`.
3. Start PHP server bound to `0.0.0.0`.
4. Share `http://<SERVER_IP>:9000` with participants.

