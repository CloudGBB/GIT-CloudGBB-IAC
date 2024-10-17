terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "CLOUDGBB-IAC-AZURE"
  location = "West Europe"
}

resource "azurerm_storage_account" "stor" {
  name                          = "cloudgbbiacstorage"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  public_network_access_enabled = true
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  tags = {
    "mapping_tag" = "bdb30cde-fa85-404c-8493-f89d7ab38cda"
  }
}
resource "azurerm_storage_container" "con" {
  name                  = "iacstorage"
  storage_account_name  = azurerm_storage_account.stor.name
  container_access_type = "blob"
}