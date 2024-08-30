terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

#Configure azure provider
provider "azurerm" {
    features {}
}

#Creat Resource - Resource group
resource "azurerm_resource_group" "example_rg" {
 name       = var.resource_group_name
 location   = var.location
}

resource "azurerm_virtual_network" "example_vent" {
  name = var.vnet_name
  address_space = [var.vent_address_space]
  location = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_subnet" "example_subnet" {
  name = var.subenet_name
  address_prefixes = [var.subnet_address_prefix]
  virtual_network_name = azurerm_virtual_network.example_vent.name
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_network_interface" "example_nic" {
  name = var.nic_name
  location = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name        = "internal"
    subnet_id   = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example_vm" {
  name = var.vm_name
  location = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_nic.id]
  vm_size = var.vm_size

  storage_image_reference {
    publisher   = var.publisher
    offer       = var.offer
    sku         = var.sku
    version     = var.image_version
}

  storage_os_disk {
    name              = "myosdisk"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

