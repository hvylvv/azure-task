#!/bin/bash

# Define variables
acrName="leahsuniqueacr"  # Replace with your ACR name
imageName="spring-petclinic-petclinic"  # Replace with your Docker image name
imageTag="latest"  # Replace with your Docker image tag
acrLoginServer="$acrName.azurecr.io"

# Log in to Azure
az login

# Log in to the ACR
az acr login --name $acrName

# Tag the Docker image with ACR login server
docker tag $imageName:$imageTag $acrLoginServer/$imageName:$imageTag

# Push the Docker image to ACR
docker push $acrLoginServer/$imageName:$imageTag
