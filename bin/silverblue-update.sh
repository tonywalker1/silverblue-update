#!/usr/bin/env sh
#
# MIT License
#
# Copyright (c) 2022  Tony Walker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#

if ! /usr/bin/install -o root -g root -m 755 -d /var/run/silverblue-update; then
    logger "silverblue-update: Could not create /var/run/silverblue-update"
    exit 1
fi

if ! /usr/bin/flatpak update -y --system --noninteractive >/var/run/silverblue-update/flatpak.log 2>&1; then
    logger "silverblue-update: Flatpak update failed"
    exit 1
fi

if ! /usr/bin/rpm-ostree update >/var/run/silverblue-update/rpm-ostree.log 2>&1; then
    logger "silverblue-update: rpm-ostree update failed"
    exit 1
fi

exit 0
