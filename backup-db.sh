#!/bin/bash
set -e

db_name="$(grep "'database' =>" /var/www/xubuntu.cz/www/sites/www.ubuntu.cz/settings.php | cut -d "'" -f4)"
db_user="$(grep "'username' =>" /var/www/xubuntu.cz/www/sites/www.ubuntu.cz/settings.php | cut -d "'" -f4)"
db_pass="$(grep "'password' =>" /var/www/xubuntu.cz/www/sites/www.ubuntu.cz/settings.php | cut -d "'" -f4)"

mysqldump --user="$db_user" --password="$db_pass" --databases "$db_name" --lock-tables=false | gzip -c > '/tmp/ubuntucz.sql.gz'
