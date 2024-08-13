env                 = "dev"
resource_group_name = "aksrg"
location            = "West US"
vnet_name = "aksvent"
vnet_address_space = "10.16.0.0/16"
nsg_name            = "aksnsg"
subnets = {
  "subnet-1" = {
    name           = "subnet-1"
    address_prefix = "10.16.1.0/24"
  }
  "subnet-2" = {
    name           = "subnet-2"
    address_prefix = "10.16.2.0/24"
  }
  "subnet-3" = {
    name           = "subnet-3"
    address_prefix = "10.16.3.0/24"
  }
}

# AKS Cluster Configuration
cluster_name                = "aks"
is_aks_cluster_enabled      = true
cluster_version             = "1.29.5"
default_node_count          = 2
default_vm_size             = "Standard_D2s_v3"

# authorized_ip_ranges = [
#     "0.0.0.0/0"  # Replace with specific IP ranges as needed
# ]

# On-Demand Node Pool Configuration
ondemand_node_pool       = "ondmdpool"
ondemand_vm_size         = "Standard_D1s_v2"
ondemand_node_count      = 1
max_ondemand_node_count  = 2
min_ondemand_node_count  = 1

# Spot Node Pool Configuration
spot_node_pool          = "spotnodepool"
spot_vm_size            = "Standard_B1s"
spot_node_count         = 1
max_spot_node_count     = 2
min_spot_node_count     = 1