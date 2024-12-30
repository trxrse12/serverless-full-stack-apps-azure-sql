#!/bin/bash

# Get resource group and location and random string
resourceGroupName="playrg"

# Fetch resource group details using Azure CLI
resourceGroup=$(az group show --name "$resourceGroupName" --query "{name:name, location:location}" --output tsv)
if [ -z "$resourceGroup" ]; then
    echo "Resource group '$resourceGroupName' not found."
    exit 1
fi

# Parse the location from the resource group
location=$(echo "$resourceGroup" | awk '{print $2}')

# Generate a unique ID
uniqueID=$((100000 + RANDOM % 900000))

# Define server name and database name
serverName="bus-server${uniqueID}"
databaseName="bus-db"

# Output the information
echo "Please note your unique ID for future exercises in this module:"
echo "$uniqueID"
echo "Your resource group name is:"
echo "$resourceGroupName"
echo "Your resources were deployed in the following region:"
echo "$location"
echo "Your server name is:"
echo "$serverName"
