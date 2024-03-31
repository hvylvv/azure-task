#!/bin/bash

# Define variables
resourceGroup="myResourceGroup"
location="eastus"
vnetName="myVNet"
subnetName="mySubnet"
acrName="leahsuniqueacr"  # Adjust to a unique name
vmName="myVM"
publicIpName="myPublicIP"
nsgName="myNSG"

# Create resource group
az group create --name $resourceGroup --location $location

# Create virtual network
az network vnet create --resource-group $resourceGroup --name $vnetName --address-prefix 10.0.0.0/16 --subnet-name $subnetName --subnet-prefix 10.0.0.0/24

# Create Azure Container Registry
az acr create --resource-group $resourceGroup --name $acrName --sku Basic --location $location

# Create VM
az vm create \
    --resource-group $resourceGroup \
    --name $vmName \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --generate-ssh-keys \
    --vnet-name $vnetName \
    --subnet $subnetName \
    --public-ip-address $publicIpName \
    --nsg $nsgName

# Create public IP address for VM with static allocation method
az network public-ip create --resource-group $resourceGroup --name $publicIpName --allocation-method Static

# Create Network Security Group
az network nsg create --resource-group $resourceGroup --name $nsgName
