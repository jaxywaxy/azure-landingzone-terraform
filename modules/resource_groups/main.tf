resource "azurerm_resource_group" "platform" {
  name     = "rg-platform"
  location = var.location
}

resource "azurerm_resource_group" "networking" {
  name     = "rg-networking"
  location = var.location
}

resource "azurerm_resource_group" "apps" {
  name     = "rg-apps-dev"
  location = var.location
}

resource "azurerm_resource_group" "logging" {
  name     = "${var.prefix}-rg-logging"
  location = var.location
}

