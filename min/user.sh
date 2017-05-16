#!/bin/bash

echo '----------------------------------------------------------------'
echo 'Setting /home/winner/.bashrc to automatically record login times'
echo "echo '------------------'" >> /home/winner/.bashrc
echo "echo 'Welcome to Docker!'" >> /home/winner/.bashrc
echo 'DATE=`date +%Y_%m%d_%H%M_%S -u`' >> /home/winner/.bashrc
echo 'echo $DATE >> /home/winner/timestamp.txt' >> /home/winner/.bashrc
echo 'cat /etc/motd' >> /home/winner/.bashrc
echo "echo '------------------------------'" >> /home/winner/.bashrc
echo "echo 'cat /home/winner/timestamp.txt'" >> /home/winner/.bashrc
echo 'cat /home/winner/timestamp.txt' >> /home/winner/.bashrc
echo 'cd /home/winner/shared' >> /home/winner/.bashrc
