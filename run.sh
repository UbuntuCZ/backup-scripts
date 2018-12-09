#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
BACKUP_ID="$(date +'%Y-%m-%d-%H-%M')"
LOCAL_BACKUP_DIR="${SCRIPT_DIR}/${BACKUP_ID}"

mkdir "${LOCAL_BACKUP_DIR}"
cd "${LOCAL_BACKUP_DIR}"

echo 'Backup Ubuntu.cz ...'

echo 'Backup database ...'
ssh ubuntucz@yasha.ubuntu.cz 'bash -s' < "${SCRIPT_DIR}/backup-db.sh"
scp ubuntucz@yasha.ubuntu.cz:'/tmp/ubuntucz.sql.gz' "${LOCAL_BACKUP_DIR}"
ssh ubuntucz@yasha.ubuntu.cz 'rm /tmp/ubuntucz.sql.gz'

echo 'Backup /var/www ...'
bash "${SCRIPT_DIR}/backup-var-www.sh"

cd -
