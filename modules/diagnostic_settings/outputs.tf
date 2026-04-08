output "diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.ds.id
}

output "applied_logs" {
  value = local.filtered_logs
}

output "applied_metrics" {
  value = local.filtered_metrics
}
output "resource_type" {
  value = var.resource_type
}

