#!/bin/bash

echo '+++++++++++++++++++++++++++++++++++++++'
echo 'BEGIN sanity checks (Developer Edition)'

# BEGIN: activate rbenv
export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# END: activate rbenv

# BEGIN: activate NVM
export NVM_DIR="/home/winner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

nvm use --lts # Activate Node

curl https://raw.githubusercontent.com/jhsu802701/docker-debian-jessie-custom/master/min/check.sh | bash

echo '-------'
echo 'perl -v'
perl -v

echo '-----------------------'
echo 'puppet master --version'
puppet master --version

echo '------------'
echo 'chef-solo -v'
chef-solo -v

echo '-----------------'
echo 'ansible --version'
ansible --version

echo '--------------'
echo 'heroku version'
heroku version

echo '-------------'
echo 'git --version'
git --version

echo '----------------'
echo 'python --version'
python --version

echo '--------------'
echo 'command -v nvm'
command -v nvm

echo '-------------'
echo 'nvm --version'
nvm --version

echo '-----------'
echo 'npm version'
npm version

echo '-------'
echo 'node -v'
node -v

echo '---------------'
echo 'redis-server -v'
redis-server -v

echo '----------------'
echo 'sqlite3 -version'
sqlite3 -version

echo '--------------'
echo 'psql --version'
psql --version

echo '----------'
echo 'type rbenv'
type rbenv

echo 'FINISHED sanity checks (Developer Edition)'
echo '++++++++++++++++++++++++++++++++++++++++++'
