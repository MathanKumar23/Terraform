# Private aks cluster

provider "azurerm" {
  features {}
}

locals {
  org = "medium"
  env = var.env
}
module "aks" {
    source = "./module/aks"

    env                         =  var.env
    resource_group_name         = "${local.env}-${local.org}-${var.resource_group_name}"
    location                    = var.location
    vnet_name                   = var.vnet_name
    vnet_address_space          = var.vnet_address_space
    subnets                     = var.subnets
    nsg_name                    = var.nsg_name
    private_cluster_enabled     = true

    cluster_name                = var.cluster_name
    cluster_version             = var.cluster_version
    is_aks_cluster_enabled      = var.is_aks_cluster_enabled
    default_node_count          = var.default_node_count
    default_vm_size             = var.default_vm_size
    ondemand_node_pool          = var.ondemand_node_pool
    ondemand_node_count         = var.ondemand_node_count
    ondemand_vm_size            = var.ondemand_vm_size
    max_ondemand_node_count     = var.ondemand_node_count
    min_ondemand_node_count     = var.min_ondemand_node_count
    spot_node_pool              = var.spot_node_pool
    spot_node_count             = var.spot_node_count
    spot_vm_size                = var.spot_vm_size
    max_spot_node_count         = var.max_spot_node_count
    min_spot_node_count         = var.min_spot_node_count
}