data "azurerm_client_config" "current" {}

module "resource_groups" {
  source   = "./modules/resource_groups"
  prefix   = var.prefix
  location = var.location
}

module "networking" {
  source     = "./modules/networking"
  prefix     = var.prefix
  location   = var.location
  rg_network = module.resource_groups.networking_name
}

module "logging" {
  source     = "./modules/logging"
  prefix     = var.prefix
  location   = var.location
  rg_logging = module.resource_groups.logging_name
}
module "vnet_diagnostics" {
  source = "./modules/diagnostic_settings"

  resource_name       = module.networking.vnet_name
  target_resource_id  = module.networking.vnet_id
  law_id              = module.logging.law_id

  logs    = ["VMProtectionAlerts", "VMInsights", "NetworkSecurityGroupEvent"]
  metrics = ["AllMetrics"]
}

