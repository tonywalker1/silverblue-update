#!/usr/bin/env bash
#
# silverblue-update
# Copyright (c) 2022 Tony Walker
#

echo "* Stopping systemd unit files..."
systemctl stop    silverblue-update.timer || exit 1
systemctl disable silverblue-update.timer || exit 1

echo "* Removing systemd unit files..."
rm -f /etc/systemd/system/silverblue-update.* || exit 1

exit 0
