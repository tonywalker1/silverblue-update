#!/usr/bin/env bash

echo "Installing the Silverblue Daily Update Tool"

if [ $(whoami) != "root" ]
then
    echo "* ERROR: Must be root or use sudo."
    exit 1
fi

echo "* Disabling rpm-ostree-countme..."
systemctl stop    rpm-ostree-countme.timer
systemctl disable rpm-ostree-countme.timer

echo "* Copying systemd unit files..."
cp units/silverblue-update.* /etc/systemd/system
systemctl enable silverblue-update.timer
systemctl start  silverblue-update.timer
