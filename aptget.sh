#!/bin/bash

# Set environment variables to cut down on annoying warning messages
export DEBIAN_FRONTEND='noninteractive'
export DEBCONF_NOWARNINGS='true'
export HOME=/root
export LC_ALL=C

echo '+++++++++++++++++++++++'
echo 'BEGIN preparing apt-get'
echo '+++++++++++++++++++++++'

echo '---------------------------------------------------------------'
echo 'Configuring /etc/apt/apt.conf to install required packages only'
echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf
echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf

echo '-------------'
echo 'cd / && du -s'
cd / && du -s

echo '--------------'
echo "apt-get update"
apt-get update

echo '------------------'
echo "apt-get upgrade -y"
apt-get upgrade -y

echo '-------------'
echo 'cd / && du -s'
cd / && du -s

echo '++++++++++++++++++++++++++'
echo 'FINISHED preparing apt-get'
echo '++++++++++++++++++++++++++'
