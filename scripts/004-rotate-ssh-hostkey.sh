#!/usr/bin/sh
sshdir="/etc/ssh"
dt=`date '+%Y%m%dT%H%M%S'

# Backup and delete the host keys
tar czf "$sshdir/hosts-$dt.tar.gz" "$sshdir/ssh_host_*"
rm -f "$sshdir/ssh_host_*"

# Regenerate the host keys
dpkg-reconfigure openssh-server