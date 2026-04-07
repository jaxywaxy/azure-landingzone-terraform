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
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
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
