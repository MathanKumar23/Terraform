variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed."
}

variable "env" {
  type        = string
  description = "The environment (e.g., dev, staging, prod) where resources will be deployed."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "vnet_address_space" {
  type        = string
  description = "The address space for the virtual network."
}

variable "subnets" {
  type = map(object({
    name            = string
    address_prefix  = string
  }))
  description = "Map of subnet names to their configurations"
}

variable "cluster_name" {
  type = string
  description = "The name of your AKS cluster (lowercase letters, numbers, hyphens, 1-12 characters)"
}

variable "cluster_version" {
  type        = string
  description = "The version of Kubernetes for the AKS cluster."
}

variable "is_aks_cluster_enabled" {
  type        = bool
  description = "Flag to enable or disable the AKS cluster creation."
}

variable "default_node_count" {
  type        = number
  description = "The number of default nodes in the AKS cluster."
}

variable "default_vm_size" {
  type        = string
  description = "The size of the VM for the default node pool."
}

# variable "api_server_access_profile" {
#   type = object({
#     authorized_ip_ranges     = set(string)
#     # subnet_id                = optional(string, null)
#     # vnet_integration_enabled = optional(bool, false)
#   })
# }

variable "authorized_ip_ranges" {
  type = set(string)
  description = "List of authorized IP ranges for API server access"
}

variable "ondemand_node_pool" {
  type = string
  description = "Name of ondemand_node_pool"
}

variable "spot_node_pool" {
  description = "Name of spot_node_pool"
}

variable "ondemand_vm_size" {
  type        = string
  description = "The size of the VM for on-demand nodes."
}

variable "ondemand_node_count" {
  type        = number
  description = "The number of on-demand nodes in the AKS cluster."
}

variable "max_ondemand_node_count" {
  type        = number
  description = "The maximum number of on-demand nodes in the AKS cluster."
}

variable "min_ondemand_node_count" {
  type        = number
  description = "The minimum number of on-demand nodes in the AKS cluster."
}

variable "spot_vm_size" {
  type        = string
  description = "The size of the VM for spot nodes."
}

variable "spot_node_count" {
  type        = number
  description = "The number of spot nodes in the AKS cluster."
}

variable "max_spot_node_count" {
  type        = number
  description = "The maximum number of spot nodes in the AKS cluster."
}

variable "min_spot_node_count" {
  type        = number
  description = "The minimum number of spot nodes in the AKS cluster."
}
