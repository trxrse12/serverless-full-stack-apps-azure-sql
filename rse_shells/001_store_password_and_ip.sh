#!/bin/bash

# Collect password
adminSqlLogin="cloudadmin"
echo "Your username is 'cloudadmin'. Please enter a password for your Azure SQL Database server that meets the password requirements:"
read -s password  # -s hides the input for security

# Prompt for local IP address
echo "Disconnect your VPN, open a terminal, and run 'curl -s https://ipinfo.io/ip'. Please enter the value (include periods) next to 'Address':"
read ipAddress

# Confirm storage of password and IP
echo "Password and IP Address stored"
