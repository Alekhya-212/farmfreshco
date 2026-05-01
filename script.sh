#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing Apache HTTPD"
echo "########################################"
sudo yum install httpd -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Deploy Local Website
echo "########################################"
echo "Deploying FarmFreshCo Website"
echo "########################################"

# Copy your main HTML file
sudo cp /farmfreshco/index.html /var/www/html/index.html

# Copy assets (CSS, JS, images)
sudo cp -r /farmfreshco/assets/* /var/www/html/

echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
sudo systemctl restart httpd
echo

# Verify Deployment
echo "########################################"
echo "Deployment Complete – Listing /var/www/html/"
echo "########################################"
ls /var/www/html/
sudo systemctl status httpd

