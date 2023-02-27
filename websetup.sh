#!/bin/bash

#Installing dependies
echo "##########"
sudo apt-get install wget unzip httpd -y /dev/null
echo

#Start enable service
echo "##############"
echo "start & enable HTTPD Service"
echo "#############"
sudo systemctl start httpd
sudo systemctl enable httpd

#Creating Temp Directory
echo "##################"
echo "Starting Artifact Deployment"
echo "#################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

#Bounce Service
echo "##############"
echo "Restarting HTTPD service"
echo "###################"
systemctl restart httpd
echo

#Clean up

echo "################"
echo "Removing Temporary files"
echo "################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html
