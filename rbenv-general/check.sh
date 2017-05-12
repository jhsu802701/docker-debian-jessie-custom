#!/bin/bash

echo '*********************************'
echo 'BEGIN rbenv-general sanity checks'

# BEGIN: activate rbenv
export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# END: activate rbenv

# BEGIN: activate NVM
export NVM_DIR="/home/winner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

nvm use --lts # Activate Node

echo '----------------'
echo 'sqlite3 -version'
sqlite3 -version

echo '--------------'
echo 'psql --version'
psql --version

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

echo '----------'
echo 'type rbenv'
type rbenv

echo '--------------'
echo 'rbenv versions'
rbenv versions

echo '-------'
echo 'ruby -v'
ruby -v

echo '--------'
echo 'rails -v'
rails -v

echo '------------------'
echo 'gem list "^rails$"'
gem list "^rails$"

echo '---------------------'
echo 'gem list "^nokogiri$"'
gem list "^nokogiri$"

echo '---------------'
echo 'gem list "^pg$"'
gem list "^pg$"

echo '------------------------'
echo 'gem list "^mailcatcher$"'
gem list "^mailcatcher$"

echo '************************************'
echo 'FINISHED rbenv-general sanity checks'
