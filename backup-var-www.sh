#!/bin/bash
set -e

REMOTE_BACKUP_FILE='/tmp/var-www.tar.gz'

echo "Creating backup file ${REMOTE_BACKUP_FILE}"
ssh ubuntucz@yasha.ubuntu.cz "tar --exclude='*/home/*' --exclude='*/logs/*' -C /var/www -czf ${REMOTE_BACKUP_FILE} ./"

echo "Downloading ${REMOTE_BACKUP_FILE}"
scp ubuntucz@yasha.ubuntu.cz:"${REMOTE_BACKUP_FILE}" './'

echo "Removing remote file ${REMOTE_BACKUP_FILE}"
ssh ubuntucz@yasha.ubuntu.cz "rm ${REMOTE_BACKUP_FILE}"
