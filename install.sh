#!/usr/bin/env bash
#
# silverblue-update
# Copyright (c) 2022 Tony Walker
#

echo "Installing the Silverblue Daily Update Tool"

if [ $(whoami) != "root" ]
then
    echo "* ERROR: Must be root or use sudo."
    exit 1
fi

echo "* Disabling rpm-ostree-countme..."
systemctl stop    rpm-ostree-countme.timer || exit 1
systemctl disable rpm-ostree-countme.timer || exit 1

echo "* Installing..."
install -o root -g root -m 644 units/silverblue-update.timer   /etc/systemd/system/ || exit 1
install -o root -g root -m 644 units/silverblue-update.service /etc/systemd/system/ || exit 1
install -o root -g root -m 755 bin/silverblue-update.sh        /usr/local/bin/      || exit 1
install -o root -g root -m 755 -d /var/run/silverblue-update                        || exit 1

echo "* Starting..."
systemctl enable silverblue-update.timer || exit 1
systemctl start  silverblue-update.timer || exit 1

echo "* Done!"
exit 0
