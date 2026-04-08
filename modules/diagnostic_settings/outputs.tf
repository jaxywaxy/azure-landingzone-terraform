output "diagnostic_setting_id" {
  description = "ID of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.ds.id
}

output "applied_logs" {
  description = "Logs that were actually applied after filtering."
  value       = local.filtered_logs
}

output "applied_metrics" {
  description = "Metrics that were actually applied after filtering."
  value       = local.filtered_metrics
}

output "resource_type" {
  description = "Resource type used for filtering."
  value       = var.resource_type
}