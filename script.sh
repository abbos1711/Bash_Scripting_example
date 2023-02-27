#!/bin/bash

echo "%%%%%%%%%%%%%%%%%%%%%%%%%"

date

ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
   echo " Httpd process is running"
else
   echo "Httpd process is NOT running"
   systemctl start httpd
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed , Contact the Admin ."
   fi
fi
echo "##################################"

