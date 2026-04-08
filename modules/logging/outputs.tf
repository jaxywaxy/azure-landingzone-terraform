output "law_id" {
  description = "Resource ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.law.id
}

output "law_workspace_id" {
  description = "Workspace ID (GUID) of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.law.workspace_id
}

output "law_primary_key" {
  description = "Primary shared key for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.law.primary_shared_key
  sensitive   = true
}

output "logs_storage_id" {
  description = "Resource ID of the storage account used for logs."
  value       = azurerm_storage_account.logs.id
}

output "logs_storage_name" {
  description = "Name of the storage account used for logs."
  value       = azurerm_storage_account.logs.name
}
