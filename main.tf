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

  resource_name      = module.networking.vnet_name
  target_resource_id = module.networking.vnet_id
  law_id             = module.logging.law_id

  logs    = ["VMProtectionAlerts", "VMInsights", "NetworkSecurityGroupEvent"]
  metrics = ["AllMetrics"]
}
/* module "nsg_diagnostics" {
  source = "./modules/diagnostic_settings"

  resource_name      = module.networking.nsg_name
  target_resource_id = module.networking.nsg_id
  law_id             = module.logging.law_id

  logs = [
    "NetworkSecurityGroupEvent",
    "NetworkSecurityGroupRuleCounter"
  ]

  metrics = ["AllMetrics"]
} */
module "storage_diagnostics" {
  source = "./modules/diagnostic_settings"

  resource_name      = module.logging.logs_storage_name
  target_resource_id = module.logging.logs_storage_id
  law_id             = module.logging.law_id

  logs = [
    "StorageRead",
    "StorageWrite",
    "StorageDelete"
  ]

  metrics = ["AllMetrics"]
}
/* module "keyvault_diagnostics" {
  source = "./modules/diagnostic_settings"

  resource_name      = module.keyvault.name
  target_resource_id = module.keyvault.id
  law_id             = module.logging.law_id

  logs    = ["AuditEvent"]
  metrics = ["AllMetrics"]
}
module "firewall_diagnostics" {
  source = "./modules/diagnostic_settings"

  resource_name      = module.firewall.name
  target_resource_id = module.firewall.id
  law_id             = module.logging.law_id

  logs = [
    "AzureFirewallApplicationRule",
    "AzureFirewallNetworkRule",
    "AzureFirewallDnsProxy"
  ]

  metrics = ["AllMetrics"]
} */
module "network_watcher" {
  source = "./modules/network_watcher"

  prefix        = var.prefix
  location      = var.location
  rg_networking = module.resource_groups.networking_name
  nsg_ids       = module.networking.nsg_ids

  storage_account_id = module.logging.logs_storage_id
  law_id             = module.logging.law_id
  law_workspace_id   = module.logging.law_workspace_id
}

