terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 2.99"
    }
  }

  cloud {
    organization = "Mightywow"
    workspaces {
      name = "remotestate"
    }
   }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

}



## n
# ## Create a resource group
# resource "azurerm_resource_group" "TFResourceGroup" {
#   name     = "AzureDevop"
#   location = "East US"
# }

# # Create storage account for Terraform remote state
# resource "azurerm_storage_account" "tfstatestorage" {
#     name                     = "tfstatestorage"
#     resource_group_name      = azurerm_resource_group.TFResourceGroup.name
#     location                 = azurerm_resource_group.TFResourceGroup.location
#     account_tier             = "Standard"
#     account_replication_type = "RAGRS"
# }





# Create virtual network
resource "azurerm_virtual_network" "TFNet" {
    name                = "LabVnet"
    address_space       = ["10.0.0.0/19"]
    location            = "eastus"
    resource_group_name = "AzureDevop"

    tags = {
        environment = "Terraform Networking"
    }
}

# Create subnet
resource "azurerm_subnet" "tfsubnet" {
    name                 = "LabSubnet"
    resource_group_name = "AzureDevop"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefixes       = ["10.0.1.0/24"]
}
