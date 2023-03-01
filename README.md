# silverblue-update
Daily Fedora Silverblue Update

# Overview

This is a simple script that updates rpm-ostree and flatpak packages. It has three simple purposes:

1. Update the system without requiring a user to enter a password or take some other action.
2. Update the system in one step. This may be important for intrusion detection, for example.
3. Generate a log file that can be emailed or integrated into monitoring tools/processes.

# Installation

Step 1: Clone or download the repository.

Step 2: Edit `bin/silverblue-update.timer` to meet your needs. See below.

Step 3: Run `install.sh` from the root of the repository.

## Customizing silverblue-update.timer
