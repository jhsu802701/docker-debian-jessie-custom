#!/bin/bash

echo '******************************'
echo 'BEGIN installing Ruby on Rails'
echo '******************************'

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
  # Certain gems (such as rainbow) require that Rubygems be updated.
  # The default version of Rubygems may be incompatible with certain
  # gems, such as rainbow, rubocop, and annotate.
  echo '-------------------'
  echo 'gem update --system'
  gem update --system

  echo '-------------------'
  echo 'gem install bundler'
  gem install bundler

  # Installing MailCatcher
  echo '-----------------------'
  echo 'gem install mailcatcher'
  gem install mailcatcher

  # The latest versions of rails, pg, and nokogiri
  echo '-----------------'
  echo 'gem install rails'
  gem install rails

  echo '--------------'
  echo 'gem install pg'
  gem install pg

  echo '--------------------'
  echo 'gem install nokogiri'
  gem install nokogiri

  # The versions of rails, pg, and nokogiri used in the Rails Tutorial Sample App
  echo '--------------------------'
  echo 'gem install rails -v 5.0.1'
  gem install rails -v 5.0.1

  echo '------------------------'
  echo 'gem install pg -v 0.18.4'
  gem install pg -v 0.18.4

  echo '-----------------------------'
  echo 'gem install nokogiri -v 1.7.0'
  gem install nokogiri -v 1.7.0

  # The versions of rails, pg, and nokogiri needed for GenericApp.
  echo '--------------------------'
  echo 'gem install rails -v 5.0.1'
  gem install rails -v 5.0.1

  echo '------------------------'
  echo 'gem install pg -v 0.18.4'
  gem install pg -v 0.18.4

  echo '-----------------------------'
  echo 'gem install nokogiri -v 1.7.0'
  gem install nokogiri -v 1.7.0
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
time_install_ruby_version 2.3.4

echo '*********************************'
echo 'FINISHED installing Ruby on Rails'
echo '*********************************'
