#!/bin/bash

# Variables
adminSqlLogin="cloudadmin"
password="AmazonianForest123!"  # Replace with your password or securely read it as an input
resourceGroupName="playrg"
serverName="bus-server114483"  # Replace $RANDOM if a specific unique ID is used
location="uksouth"  # Replace with your desired location
ipAddress="82.4.91.89"  # Replace with your IP address
databaseName="bus-db"

# Create a new Azure SQL server
echo "Creating Azure SQL Server..."
az sql server create \
    --name "$serverName" \
    --resource-group "$resourceGroupName" \
    --location "$location" \
    --admin-user "$adminSqlLogin" \
    --admin-password "$password"

# Create a firewall rule to allow access from a specific IP
echo "Creating firewall rule for IP $ipAddress..."
az sql server firewall-rule create \
    --resource-group "$resourceGroupName" \
    --server "$serverName" \
    --name "AllowedIPs" \
    --start-ip-address "$ipAddress" \
    --end-ip-address "$ipAddress"

# Create a firewall rule to allow all Azure IPs
echo "Creating firewall rule to allow all Azure IPs..."
az sql server firewall-rule allow-all-azure-ips \
    --resource-group "$resourceGroupName" \
    --server "$serverName"

# Create a database
echo "Creating Azure SQL Database..."
az sql db create \
    --resource-group "$resourceGroupName" \
    --server "$serverName" \
    --name "$databaseName" \
    --edition "GeneralPurpose" \
    --family "Gen5" \
    --capacity 4 \
    --compute-model "Serverless" \
    --min-capacity 0.5

echo "Database deployed successfully."
