resource_group_name     = "my-terraform-rg1"
location                = "EastUS"
vnet_name               = "my-vent"
vent_address_space      = "10.0.0.0/16"
subenet_name            = "my-subnet"
subnet_address_prefix   = "10.0.1.0/24"
nic_name                = "my-nic"
vm_name                 = "my-vm"
vm_size                 = "Standard_DS1_v2"
publisher               = "Canonical"
offer                   = "UbuntuServer"
sku                     = "18.04-LTS"
image_version           = "latest"
admin_username          = "adminuser"
admin_password          = "Password123!"
