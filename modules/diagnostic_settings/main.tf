resource "azurerm_monitor_diagnostic_setting" "ds" {
  name                       = "${var.resource_name}-diag"
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.law_id

  dynamic "enabled_log" {
    for_each = var.logs
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value
      enabled  = true
    }
  }
}
