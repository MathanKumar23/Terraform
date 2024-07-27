terraform {
  backend "azurerm" {
    resource_group_name   = "myResourceGroup"
    storage_account_name  = "myterraformstorageacc"
    container_name        = "terraformstate"
    key                   = "terraform.tfstate"
    access_key            = var.access_key
  }
}

variable "access_key" {
  description = "The access key for the storage account"
  type        = string
  default     = ""
}

#terraform init -backend-config="access_key=$ARM_ACCESS_KEY"
