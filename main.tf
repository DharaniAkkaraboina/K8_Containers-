provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource Group
resource "azurerm_resource_group" "myaks" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "myaks" {
  name                = "myaks-vnet"
  address_space       = ["10.0.0.0/8"]
  location            = azurerm_resource_group.myaks.location
  resource_group_name = azurerm_resource_group.myaks.name
}

# Subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.myaks.name
  virtual_network_name = azurerm_virtual_network.myaks.name
  address_prefixes     = ["10.240.0.0/16"]
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "myaks" {
  name                = "myaks"
  location            = azurerm_resource_group.myaks.location
  resource_group_name = azurerm_resource_group.myaks.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.node_size
    vnet_subnet_id  = azurerm_subnet.aks_subnet.id
    type            = "VirtualMachineScaleSets"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = "test"
  }
}
