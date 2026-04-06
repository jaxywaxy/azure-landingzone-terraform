data "azurerm_client_config" "current" {}

module "resource_groups" {
  source   = "./modules/resource_groups"
  location = var.location
}

module "networking" {
  source        = "./modules/networking"
  prefix	= var.prefix
  location      = var.location
  rg_networking = module.resource_groups.networking_name
}

module "logging" {
  source      = "./modules/logging"
  location    = var.location
  rg_platform = module.resource_groups.platform_name
}
