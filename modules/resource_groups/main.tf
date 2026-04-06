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

output "apps_name" {
  value = azurerm_resource_group.apps.name
}
resource "azurerm_resource_group" "logging" {
  name     = "${var.prefix}-rg-logging"
  location = var.location
}

output "logging_name" {
  value = azurerm_resource_group.logging.name
}
