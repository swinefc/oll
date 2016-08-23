#!/bin/bash

USER=$1

rm /tmp/login.txt

# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>/tmp/login.txt

# Redirect STDERR to STDOUT
exec 2>&1

date

echo Login Script Running - $USER

if [ "$USER" == "student" ]; then
	echo Logging in as student
else
	echo Exiting, user not student
	exit 0
fi

find /Users/student -name '.*' -maxdepth 1 -type f -delete

rm -rf /Users/student/*

tar -xpo -C / /OLL/account_templates/student_templates.tgz

# Remove files I know we do not need
rm -rf /Users/student/Library/Keychains
rm -rf /Users/student/Library/Caches/*
rm -rf /Users/student/Library/Logs/*
rm /Users/student/.bash_history
rm -rf /Users/student/.bash_sessions
rm /Users/student/.lesshst
rm -rf /Users/student/Library/Containers/*
rm -rf /Users/student/Library/Preferences/ByHost/*
rm -rf /Users/student/Library/Dictionaries/CoreDataUbiquitySupport
rm -rf /Users/student/Library/Application\ Support/AddressBook/*
chown -R student:staff /Users/student

echo DONE
