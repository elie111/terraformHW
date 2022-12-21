#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo echo "hw6 elie Web Server " > /var/www/html/index.html