#!/bin/bash
cat /root/header.txt
cat /etc/hubzero.secrets
echo -e "\n\n"

# Cleanup apache pid if you shutdown in a hurry. - JBG
rm /var/run/apache2/apache2.pid

# Start mysql - JBG
service mysql start

# Start apache - JBG
apachectl -DFOREGROUND

