#!/usr/bin/env bash
apt-get install -y burpsuite zaproxy

for bin in burpsuite zaproxy; do
	oldbin=`which $bin`
	newbin="$oldbin.real"
	mv $oldbin $newbin
	echo gksudo $newbin > $oldbin
	chmod +x $oldbin
done 