output "law_id" {
  description = "The resource ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.id
}

output "law_name" {
  description = "The name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.name
}
