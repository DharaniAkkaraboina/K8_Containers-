variable "subscription_id" {
  description = "Subscription ID where the resources will be created."
}

variable "client_id" {
  description = "Client ID for the AKS service principal."
}

variable "client_secret" {
  description = "Client secret for the AKS service principal."
}

variable "tenant_id" {
  description = "Tenant ID for the AKS service principal."
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy AKS."
}

variable "location" {
  description = "Location of the AKS cluster."
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster."
  default     = 3
}

variable "node_size" {
  description = "Size of the nodes in the AKS cluster."
  default     = "Standard_D2_v2"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use in the AKS cluster."
  default     = "1.22"
}
