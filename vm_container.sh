#!/bin/bash

# Define variables
vmName="myVM"  # Replace with your VM name
resourceGroup="myResourceGroup"  # Replace with your resource group name
acrName="leahsuniqueacr"  # Replace with your ACR name
imageName="spring-petclinic-petclinic"  # Replace with your Docker image name
imageTag="latest"  # Replace with your Docker image tag

# Log in to ACR
az acr login --name $acrName

# Pull the Docker image from ACR
docker pull $acrName.azurecr.io/$imageName:$imageTag

# Run the Docker container on the Azure VM
docker run -d -p 8080:8080 --name $imageName $acrName.azurecr.io/$imageName:$imageTag
