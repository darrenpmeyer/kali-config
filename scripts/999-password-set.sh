#!/usr/bin/env bash
if [ $UID != 0 ]; then
	echo "This really needs to be run as root"
	exit 3
fi

echo "Changing password for $USER"
passwd

if (grep -q analyst /etc/passwd); then
	echo "Changing analyst password"
	passwd analyst
fi