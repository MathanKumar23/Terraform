# Azure Terraform Configuration

This repository contains Terraform configurations for setting up a basic Azure environment including a resource group, virtual network, subnet, network interface, and a virtual machine.

## Prerequisites

1. **Azure Account**
   - You need an Azure account to create and manage resources. If you don’t have one, you can [create an Azure account](https://azure.microsoft.com/en-us/free/).

2. **Azure CLI**
   - Install the Azure Command-Line Interface (CLI) to manage Azure resources and authenticate Terraform with Azure.
   - Installation instructions can be found [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

3. **Terraform**
   - Install Terraform to apply and manage the configurations.
   - Installation instructions can be found [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).

4. **IDE (Optional)**
   - Use an IDE like [Visual Studio Code](https://code.visualstudio.com/) with Terraform extensions to simplify writing and managing Terraform configurations.

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/MathanKumar23/Terraform.git
   cd Terraform
   
1.  **Configure Azure CLI**

    -   Authenticate to your Azure account:

        `az login`

    -   Set the subscription cr change tenant if required

2.  **Initialize Terraform**

    -   Initialize the Terraform working directory to download the required provider plugins and set up the backend:

        `terraform init`

3.  **Configure Variables**

    -   Create a `terraform.tfvars` file in the root directory with the following content. Update the values according to your requirements:

        ```resource_group_name     = "my-terraform-rg1"
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

    -   **Note:** Ensure you do not commit sensitive information like passwords to version control.

4.  **Review and Apply the Configuration**

    -   Review the configuration to ensure it's correct:

        `terraform plan`

    -   Apply the configuration to create the resources:

        `terraform apply`

    -   Confirm the action by typing `yes` when prompted.

Backend and State Locking
-------------------------

1.  **Backend Configuration**

    -   The `backend.tf` file configures the backend for storing the Terraform state file. If using Azure Storage for remote state, ensure the container and storage account are set up:


        ```terraform {
          backend "azurerm" {
            resource_group_name  = "my-terraform-state"
            storage_account_name = "myterraformstate"
            container_name       = "tfstate"
            key                  = "terraform.tfstate"
          }
        }

    -   Run `terraform init` again to configure the backend.

2.  **State Locking**

    -   Terraform automatically handles state locking when using a supported backend to prevent concurrent operations.

File Descriptions
-----------------

-   **`main.tf`**: Contains the main Terraform configuration for creating Azure resources such as the resource group, virtual network, subnet, network interface, and virtual machine.
-   **`variables.tf`**: Defines the variables used in the Terraform configuration.
-   **`terraform.tfvars`**: Contains the variable values for the configuration. Update this file with your specific details.
-   **`backend.tf`**: Configures the backend for managing the Terraform state file. Update this file if you use a remote backend.

Documentation and Resources
---------------------------

- [Terraform Documentation](https://www.terraform.io/docs)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Azure Provider](https://learn.hashicorp.com/collections/terraform/azure)


