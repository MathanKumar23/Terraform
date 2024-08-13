terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Check for the latest version
    }
  }
  # Include the variables file (if needed)
}
# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet
# resource "azurerm_subnet" "subnet" {
#   count               = length(var.subnets)
#   name                = var.subnets[count.index].name
#   resource_group_name = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes    = var.subnets[count.index]["address_prefix"]
# }
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets  #for each loop through map or set not list

  name                 = each.value.name
  address_prefixes     = [each.value.address_prefix]  # Wrap in a list
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}


# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  count               = var.is_aks_cluster_enabled ? 1 : 0
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.cluster_version

  default_node_pool {
    name       = "default"
    node_count = var.default_node_count
    vm_size    = var.default_vm_size
    vnet_subnet_id = azurerm_subnet.subnet["subnet-1"].id
  }

   # Azure CNI Networking
  network_profile {
    network_plugin = "azure"
  }

  identity {
    type = "SystemAssigned"
  }

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  tags = {
    Name = var.cluster_name
    Env  = var.env
  }

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet,
    azurerm_subnet.subnet
  ]
}

# Node Pool for On-Demand Nodes
resource "azurerm_kubernetes_cluster_node_pool" "ondemand_node_pool" {
  kubernetes_cluster_id    = azurerm_kubernetes_cluster.aks[0].id
  name           = var.ondemand_node_pool
  vm_size        = var.ondemand_vm_size
  node_count     = var.ondemand_node_count
  max_count      = var.max_ondemand_node_count
  min_count      = var.min_ondemand_node_count

  tags = {
    Name = "${var.cluster_name}-ondemand-nodes"
  }

  depends_on = [azurerm_kubernetes_cluster.aks]
}

# Node Pool for Spot Nodes
resource "azurerm_kubernetes_cluster_node_pool" "spot_node_pool" {
  kubernetes_cluster_id    = azurerm_kubernetes_cluster.aks[0].id
  name           = var.spot_node_pool
  vm_size        = var.spot_vm_size
  node_count     = var.spot_node_count
  max_count      = var.max_spot_node_count
  min_count      = var.min_spot_node_count

  tags = {
    Name = "${var.cluster_name}-spot-nodes"
  }

  depends_on = [azurerm_kubernetes_cluster.aks]
}
