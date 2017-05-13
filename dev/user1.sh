#!/bin/bash

# NOTE: The installation/configuration tasks executed as the user
# are split into 2 parts.
# Installing NVM and activating NVM must be executed in two different scripts.
# Attempts to install and activate NVM in the same script did not pan out.

# When you install NVM manually, you must open a new shell session in order
# to activate and use it.

echo '-----------------------'
echo 'BEGIN installing Heroku'
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh # Install Heroku Toolbelt
wait
heroku version
wait
heroku version
wait
heroku version
wait
echo 'FINISHED installing Heroku'
echo '--------------------------'

echo '++++++++++++++++++++'
echo 'BEGIN installing NVM'

echo '-----------------------------------------------------------------'
echo 'git clone https://github.com/creationix/nvm.git /home/winner/.nvm'
git clone https://github.com/creationix/nvm.git /home/winner/.nvm

echo '-------------------------------------'
echo 'cd /home/winner/.nvm && sh install.sh'
cd /home/winner/.nvm && sh install.sh

echo '----'
echo 'wait'
wait

echo 'FINISHED installing NVM'
echo '+++++++++++++++++++++++'
