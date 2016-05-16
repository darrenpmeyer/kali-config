#!/usr/bin/env bash
workdir=$(dirname $0)
cp "$workdir/../support/anon_boot.sh" /etc/init.d
chmod +x /etc/init.d/anon_boot.sh

for lvl in 2 3 4 5; do
  rcd=/etc/rc${lvl}.d/S01anon_boot
  if [ -f $rcd ]; then rm $rcd ; fi
  ln -s /etc/init.d/anon_boot.sh $rcd
done