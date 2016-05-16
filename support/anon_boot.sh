#!/bin/bash
### BEGIN INIT INFO
# Provides:          anon_boot
# Required-Start:    checkfs checkroot-bootclean
# Required-Stop: 
# Default-Start:     S
# Default-Stop:
# Short-Description: Anonymizes the machine on boot
# Description:
### END INIT INFO

hosts=/etc/hosts
hn=/etc/hostname

case $1 in
start)
   # Set a random hostname
   tempfile=`mktemp`
   OLD_HOST=`cat "$hn"`
   NEW_HOST=`egrep '^[a-z]+$' /usr/share/dict/words | shuf -n 1`
   perl -pe "s/(127\\.0\\.1\\.1\\s+)(.+)/\\1$NEW_HOST/g" "$hosts" > "$tempfile"
   mv "$tempfile" "$hosts"
   rm -f "$tempfile"
   chmod 0644 "$hosts"

   echo $NEW_HOST > "$hn"

   # TODO - Random MAC address
;;
reload|restart|force-reload)
   # doesn't make sense as an operation
   echo "Action '$1' doesn't make sense here" >&2
   exit 3
;;
stop|status)
   # NOOP
;;
*)
   echo "Usage: $0 start" >&2
   exit 3
;;
esac
