variable "resource_group_name" {}
variable "location" {}
variable "env" {}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnets" {
  type = map(object({
    name            = string
    address_prefix  = string
  }))
}
variable "nsg_name" {}
variable "cluster_name" {}
variable "is_aks_cluster_enabled" {}
variable "cluster_version" {}
variable "default_node_count" {
  type        = number
}

variable "default_vm_size" {
  type        = string
}


# variable "authorized_ip_ranges" {
#   type = set(string)
# }

variable "ondemand_node_pool" {}
variable "spot_node_pool" {}

variable "ondemand_vm_size" {
  type        = string
}

variable "ondemand_node_count" {
  type        = number
}

variable "max_ondemand_node_count" {
  type        = number
}

variable "min_ondemand_node_count" {
  type        = number
}

variable "spot_vm_size" {}

variable "spot_node_count" {
  type        = number
}

variable "max_spot_node_count" {
  type        = number
}

variable "min_spot_node_count" {
  type        = number
}
