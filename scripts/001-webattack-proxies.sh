#!/usr/bin/env bash
apt-get install -y burpsuite zaproxy

echo "Adding sudo-enabled menu items"
workdir=$(dirname $0)
for menudir in /usr/share/applications /usr/share/kali-menu/applications
do
	for shortcut in kali-zaproxy kali-burpsuite
	do
		shortcut="$shortcut.desktop"
		if [ -f $menudir/$shortcut ]
		then
			rm -f $menudir/$shortcut
		fi

		cp -v "$workdir/../support/$shortcut" $menudir/$shortcut
	done
done