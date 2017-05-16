#!/bin/bash

# Set environment variables to cut down on annoying warning messages
export DEBIAN_FRONTEND='noninteractive'
export DEBCONF_NOWARNINGS='true'
export HOME=/root
export LC_ALL=C

# Add apt-utils
echo '----------------------------'
echo 'apt-get install -y apt-utils'
apt-get install -y apt-utils

# Add Sudo
echo '-----------------------'
echo 'apt-get install -y sudo'
apt-get install -y sudo

# Add Nano
echo '-----------------------'
echo 'apt-get install -y nano'
apt-get install -y nano

# Add Tree
echo '-----------------------'
echo 'apt-get install -y tree'
apt-get install -y tree

# Add Tmux
echo '-----------------------'
echo 'apt-get install -y tmux'
apt-get install -y tmux

# Adding user 'winner'
echo '---------------------------------------------'
echo "adduser --disabled-password --gecos '' winner"
adduser --disabled-password --gecos '' winner

# Giving user 'winner' access to sudo
echo '-------------------'
echo 'adduser winner sudo'
adduser winner sudo

# Giving root access to sudo
echo '-----------------'
echo "adduser root sudo"
adduser root sudo

echo '-----------------------------'
echo 'Setting /etc/sudoers settings'
# No password required to use sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers
echo 'Updating /etc/sudoers to ensure that apt-get works'
echo 'Defaults env_reset' >> /etc/sudoers
echo 'Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /etc/sudoers

