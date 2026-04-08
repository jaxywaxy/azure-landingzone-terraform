locals {
  # Known supported categories for common resource types
  # (Extend as needed — module is future‑proof)
  storage_supported_logs = [
    "StorageWrite",
    "StorageDelete",
    "BlobRead",
    "BlobWrite",
    "BlobDelete",
    "BlobTierChange",
    "StorageLifecycleManagement"
  ]

  keyvault_supported_logs = [
    "AuditEvent"
  ]

  nsg_supported_logs = [
    "NetworkSecurityGroupEvent",
    "NetworkSecurityGroupRuleCounter"
  ]

  vnet_supported_logs = [
    "VMProtectionAlerts",
    "VMInsights",
    "NetworkSecurityGroupEvent"
  ]

  # Select supported logs based on resource type
 supported_logs = (
   can(regex("Microsoft\\.Storage", var.resource_type)) ? local.storage_supported_logs :
   can(regex("Microsoft\\.KeyVault", var.resource_type)) ? local.keyvault_supported_logs :
   can(regex("Microsoft\\.Network/networkSecurityGroups", var.resource_type)) ? local.nsg_supported_logs :
   can(regex("Microsoft\\.Network/virtualNetworks", var.resource_type)) ? local.vnet_supported_logs :
   var.logs
 )


  # Filter logs to only those supported
  filtered_logs = [
    for log in var.logs : log
    if contains(local.supported_logs, log)
  ]

  # Metrics are usually consistent, but still filter
  filtered_metrics = [
    for m in var.metrics : m
    if m != null
  ]
}

resource "azurerm_monitor_diagnostic_setting" "ds" {
  name                       = "${var.resource_name}-diag"
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.law_id

  # Logs
  dynamic "enabled_log" {
    for_each = local.filtered_logs
    content {
      category = enabled_log.value
    }
  }

  # Metrics
  dynamic "metric" {
    for_each = local.filtered_metrics
    content {
      category = metric.value
    }
  }

  # Optional sinks
  eventhub_name             = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_auth_rule_id
  storage_account_id        = var.archive_storage_id
}

