resource "azurerm_resource_group" "platform" {
  name     = "${var.prefix}-rg-platform"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "networking" {
  name     = "${var.prefix}-rg-networking"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "apps" {
  name     = "${var.prefix}-rg-apps"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "logging" {
  name     = "${var.prefix}-rg-logging"
  location = var.location
  tags     = var.tags
}
module "resource_groups" {
  source   = "../../modules/resource_groups"
  prefix   = var.prefix
  location = var.location
  tags     = module.tags.tags
}


