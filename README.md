# PreReq 
Admin of an Azure subscription setup and
ready to use.
• Have a dockerhub account
• Install Terraform
• Install Kubectl
• Install Helm

# Test Template
Build AKS cluster
• Deploy 3 tier application
• Build Database for Application.

## To build an AKS cluster and deploy a 3-tier application with a database, you can follow these general steps:

- Create an Azure resource group to contain all the resources for your AKS cluster and application.
- Use Terraform to define and provision an AKS cluster in the resource group.
- Use kubectl to connect to the AKS cluster and deploy your 3-tier application to the cluster. You can use Helm charts or Kubernetes manifests to deploy your application.
-  Create a database for your application, such as Azure Database for MySQL or Azure SQL Database, and configure it to work with your application.


** Use kubectl to deploy your 3-tier application to the AKS cluster. 
   Here's an example deployment using a Helm chart for a simple guestbook application:
   
   - helm repo add bitnami https://charts.bitnami.com/bitnami 
   - helm install guestbook bitnami/guestbook --set frontend.service.type=LoadBalancer

** Create a database for your application. Here's an example using Azure Database for MySQL:

az mysql server create --resource-group my-aks-rg --name mymysqlserver --location eastus --admin-user myadmin --admin-password mysecretpassword --sku-name GP_Gen5_2


