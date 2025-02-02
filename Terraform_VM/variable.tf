variable "resource_group_name" {
  description = "The name of the resource group"
  type = string 
}

variable "location" {
  description = "Location for the resource"
  type = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type = string
}

variable "vent_address_space" {
  description = "The Address space of the virtual network"
  type = string
}

variable "subenet_name" {
  description = "The name of the subnet"
  type = string
}

variable "subnet_address_prefix" {
  description = "The Address prefix of the subnet"
  type = string
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "publisher" {
  description = "The publisher of the image"
  type        = string
}

variable "offer" {
  description = "The offer of the image"
  type        = string
}

variable "sku" {
  description = "The SKU of the image"
  type        = string
}

variable "image_version" {
  description = "The version of the image"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}