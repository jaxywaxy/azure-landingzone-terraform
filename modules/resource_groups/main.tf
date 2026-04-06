variable "location" {
  type = string
}

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

output "platform_name" {
  value = azurerm_resource_group.platform.name
}

output "networking_name" {
  value = azurerm_resource_group.networking.name
}

output "apps_name" {
  value = azurerm_resource_group.apps.name
}
