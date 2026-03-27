provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "test-resource-group"
  location = "Central India"
}

resource "azurerm_storage_account" "sa" {
  name                     = "teststorage${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}