#!/usr/bin/env bash
useradd -g users -G sudo,root,wireshark -s /bin/bash -m analyst
echo "analyst:password" | chpasswd
chage -d 0 analyst
