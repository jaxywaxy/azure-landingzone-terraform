variable "location" {
  type = string
}

variable "rg_networking" {
  type = string
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_networking
}

resource "azurerm_subnet" "shared" {
  name                 = "snet-shared"
  resource_group_name  = var.rg_networking
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.1.0/24"]
}

