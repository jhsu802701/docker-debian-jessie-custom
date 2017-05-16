#!/bin/bash

echo '********************************'
echo 'BEGIN installing Ruby and Jekyll'
echo '********************************'

# BEGIN: activate rbenv
export PATH="/home/winner/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# END: activate rbenv

# BEGIN: activate NVM
export NVM_DIR="/home/winner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

nvm use --lts # Activate Node

# Set of gems to install for each version of Ruby
function install_gems {
  echo '-------------------'
  echo 'gem install bundler'
  gem install bundler

  echo '------------------'
  echo 'gem install jekyll'
  gem install jekyll
}

# Input parameter: 'ruby-x.y'
function install_ruby_version {
  ruby_version=$1
  echo '++++++++++++++++++++++++++++++++'
  echo "time rbenv install $ruby_version"
  time rbenv install $ruby_version
  echo ' /\'
  echo '/  \'
  echo "Time to install Ruby $rubyversion"
  rbenv global $ruby_version
  time install_gems
  echo ' /\'
  echo '/  \'
  echo 'Time to install gems'  
}

function time_install_ruby_version {
  RUBY_VERSION=$1
  time install_ruby_version $RUBY_VERSION
  echo ' /\'
  echo '/  \'
  echo "Time to install Ruby $RUBY_VERSION and gems"
  rbenv global $RUBY_VERSION
}
# Latest versions of Ruby
# https://www.ruby-lang.org/en/downloads/
time_install_ruby_version 2.4.1

echo '***********************************'
echo 'FINISHED installing Ruby and Jekyll'
echo '***********************************'
