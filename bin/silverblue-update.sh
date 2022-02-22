#!/usr/bin/env bash
#
# silverblue-update
# Copyright (c) 2022 Tony Walker
#

/usr/bin/install -o root -g root -m 755 -d /var/run/silverblue-update
if [ $? -ne 0 ]
then
    logger "silverblue-update: Could not create /var/run/silverblue-update"
    exit 1
fi

/usr/bin/flatpak update -y --system --noninteractive >/var/run/silverblue-update/flatpak.log 2>&1
if [ $? -ne 0 ]
then
    logger "silverblue-update: Flatpak update failed"
    exit 1
fi

/usr/bin/rpm-ostree update >/var/run/silverblue-update/rpm-ostree.log 2>&1
if [ $? -ne 0 ]
then
    logger "silverblue-update: rpm-ostree update failed"
    exit 1
fi

exit 0
