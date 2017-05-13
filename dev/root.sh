#!/bin/bash

# Set environment variables to cut down on annoying warning messages
export DEBIAN_FRONTEND='noninteractive'
export DEBCONF_NOWARNINGS='true'
export HOME=/root
export LC_ALL=C

echo '----------------------'
echo 'apt-get install -y git'
apt-get install -y git

echo '-------------------------'
echo 'apt-get install -y puppet'
apt-get install -y puppet

echo '+++++++++++++++++++++'
echo 'BEGIN installing Chef'
echo '---------------------------------------'
echo 'apt-get install -y curl ca-certificates'
apt-get install -y curl ca-certificates
echo '-------------------------------------------------------'
echo 'curl -L https://www.opscode.com/chef/install.sh | bash;'
curl -L https://www.opscode.com/chef/install.sh | bash;
rm -f /tmp/chef*deb;
chef-solo -v
echo 'FINISHED installing Chef'
echo '++++++++++++++++++++++++'

echo '------------------------------------'
echo 'apt-get install -y python2.7 ansible'
apt-get install -y python2.7 ansible

# Needed for Heroku
echo '----------------------------------------------------------'
echo 'apt-get install -y git wget ca-certificates openssh-client'
apt-get install -y git wget ca-certificates openssh-client

# Needed for NVM
echo '---------------------------------------------------------------------------'
echo 'apt-get install -y build-essential libssl-dev curl wget git ca-certificates'
apt-get install -y build-essential libssl-dev curl wget git ca-certificates

echo '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'BEGIN installing and configuring PostgreSQL for Ruby on Rails'

echo '--------------------------'
echo 'apt-get install -y locales'
apt-get install -y locales

# LANGUAGE SETTINGS
export LANGUAGE=en_US.UTF-8
echo "export LANGUAGE=en_US.UTF-8" >> /etc/bash.bashrc
export LANG=en_US.UTF-8
echo "export LANG=en_US.UTF-8" >> /etc/bash.bashrc
export LC_ALL=en_US.UTF-8
echo "export LC_ALL=en_US.UTF-8" >> /etc/bash.bashrc

echo "BEGIN locale-gen en_US.UTF-8"
locale-gen en_US.UTF-8
wait
echo "FINISHED locale-gen en_US.UTF-8"

echo '"en_US.UTF-8 UTF-8" >> /etc/locale.gen'
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

echo "PRESEED"
echo "locales	locales/default_environment_locale	select	en_US.UTF-8" > preseed.txt
echo "locales	locales/locales_to_be_generated	multiselect	en_US ISO-8859-1, en_US.UTF-8 UTF-8" >> preseed.txt
echo "DEBCONF"
debconf-set-selections preseed.txt
rm preseed.txt
echo "DPKG-RECONFIGURE LOCALES"
dpkg-reconfigure locales -f noninteractive
wait

# INSTALL POSTGRESQL
echo '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'BEGIN installing and configuring PostgreSQL for Ruby on Rails'
apt-get install -y postgresql

PG_VERSION="$(ls /etc/postgresql)"

echo '---------------------------------------'
echo 'Backing up original PostgreSQL settings'
PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_CONF_ORIG="/etc/postgresql/$PG_VERSION/main/postgresql_orig.conf"
PG_CONF_PREF="/etc/postgresql/$PG_VERSION/main/postgresql_preferred.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_HBA_ORIG="/etc/postgresql/$PG_VERSION/main/pg_hba_orig.conf"
PG_HBA_PREF="/etc/postgresql/$PG_VERSION/main/pg_hba_preferred.conf"
cp $PG_CONF $PG_CONF_ORIG
cp $PG_HBA $PG_HBA_ORIG

echo '--------------------'
echo "Configuring $PG_CONF"
sed -i 's/^port = .*/port = 5432/' $PG_CONF
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" $PG_CONF
cp $PG_CONF $PG_CONF_PREF

echo '-------------------'
echo "Configuring $PG_HBA"
echo "# Database administrative login by Unix domain socket" | tee $PG_HBA
echo "local   all             postgres                                peer" | tee -a $PG_HBA
echo "" | tee -a $PG_HBA
echo "# TYPE  DATABASE        USER            ADDRESS                 METHOD" | tee -a $PG_HBA
echo "" | tee -a $PG_HBA
echo "# local is for Unix domain socket connections only" | tee -a $PG_HBA
echo "local   all             all                                     md5" | tee -a $PG_HBA
echo "" | tee -a $PG_HBA
echo "# IPv4 local connections:" | tee -a $PG_HBA
echo "host    all             all             0.0.0.0/0            md5" | tee -a $PG_HBA
echo "" | tee -a $PG_HBA
echo "# IPv6 local connections:" | tee -a $PG_HBA
echo "host    all             all             ::1/128                 md5" | tee -a $PG_HBA
echo "" | tee -a $PG_HBA
echo "host    all             all             all                     md5" | tee -a $PG_HBA
cp $PG_HBA $PG_HBA_PREF

# The PostgreSQL server is NOT automatically started in Docker.
# Setting the 'smart' flag (instead of the default 'fast' flag) prevents
# the error message "Problem: FATAL:  the database system is starting up"
echo '------------------------'
echo 'Configuring /etc/rc.conf'
echo 'postgresql_flags="-s -m smart"' > /etc/rc.conf

echo 'FINISHED installing and configuring PostgreSQL for Ruby on Rails'
echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'

echo '++++++++++++++++++++++++++++++++++++++++++++'
echo 'BEGIN installing rbenv prerequisites as root'
echo '++++++++++++++++++++++++++++++++++++++++++++'

# Needed for rbenv itself:
apt-get install -y git ca-certificates curl bzip2 build-essential
apt-get install -y libssl-dev libreadline-dev zlib1g-dev

apt-get install -y libpq-dev # Needed for pg gem
apt-get install -y sqlite3 # SQLite3
apt-get install -y libsqlite3-dev # Needed for sqlite3 gem
apt-get install -y redis-server # Some Rails apps use Redis
apt-get install -y graphviz # Needed for railroady and rails-erd gems
apt-get install -y imagemagick # Needed for image parameters in Rails projects

echo '+++++++++++++++++++++++++++++++++++++++++++++++'
echo 'FINISHED installing rbenv prerequisites as root'
echo '+++++++++++++++++++++++++++++++++++++++++++++++'
