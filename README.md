# Azure Practical Task

Write one or several bash scripts (using az cli) which:
Create Resource Group (RG), VNet, Subnet, Azure Container Registry (ACR), VM, public IP address for VM, Network Security group (NSG)
(create-resources.sh)


Push a java spring-petlinic container image you built in “Docker” module to ACR 
(push-petclinic.sh)


ACR should be private
Install Docker on the VM
Run container on the VM
(vm_container.sh)


Verify that application is accessible in your browser (vmip:8080)
Remove the resource group (use az group delete --name myResourceGroup --yes --no-wait)
