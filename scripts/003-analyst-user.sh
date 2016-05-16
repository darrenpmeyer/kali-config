#!/usr/bin/env bash
useradd -g users -G sudo,root,wireshark -s /bin/bash -m analyst
sudo -u analyst ssh-keygen -q -b 4096 -f ~/.ssh/id_rsa -N ""
echo "analyst:password" | chpasswd
chage -d 0 analyst
