resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.prefix}-law"
  location            = var.location
  resource_group_name = var.rg_logging
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_storage_account" "logs" {
  name                     = "${var.prefix}logstore"
  resource_group_name      = var.rg_logging
  location                 = var.location
  account_kind             = "StorageV2"   
  account_tier             = "Standard"
  account_replication_type = "LRS"
  blob_properties {
  versioning_enabled            = false
  change_feed_enabled           = false
  last_access_time_enabled      = false
}
  tags = var.tags
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_id    = azurerm_storage_account.logs.id
  container_access_type = "private"
}
output "law_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "law_workspace_id" {
  value = azurerm_log_analytics_workspace.law.workspace_id
}

output "law_primary_key" {
  value     = azurerm_log_analytics_workspace.law.primary_shared_key
  sensitive = true
}

output "logs_storage_id" {
  value = azurerm_storage_account.logs.id
}

output "logs_storage_name" {
  value = azurerm_storage_account.logs.name
}
