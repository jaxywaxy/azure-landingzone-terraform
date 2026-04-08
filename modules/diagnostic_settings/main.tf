data "azurerm_resource" "target" {
  id = var.target_resource_id
}

locals {
  # Extract resource type dynamically
  resource_type = data.azurerm_resource.target.type

  # Supported logs per resource type
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

  # Resource-type-aware selection using regex
  supported_logs = (
    can(regex("Microsoft\\.Storage", local.resource_type)) ? local.storage_supported_logs :
    can(regex("Microsoft\\.KeyVault", local.resource_type)) ? local.keyvault_supported_logs :
    can(regex("Microsoft\\.Network/networkSecurityGroups", local.resource_type)) ? local.nsg_supported_logs :
    can(regex("Microsoft\\.Network/virtualNetworks", local.resource_type)) ? local.vnet_supported_logs :
    var.logs # fallback
  )

  # Filter logs to only those supported
  filtered_logs = [
    for log in var.logs : log
    if contains(local.supported_logs, log)
  ]

  # Metrics (simple filter)
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

      retention_policy {
        enabled = var.retention_enabled
        days    = var.retention_days
      }
    }
  }

  # Metrics
  dynamic "metric" {
    for_each = local.filtered_metrics
    content {
      category = metric.value
      enabled  = true

      retention_policy {
        enabled = var.retention_enabled
        days    = var.retention_days
      }
    }
  }

  # Optional sinks
  eventhub_name                    = var.eventhub_name
  eventhub_authorization_rule_id   = var.eventhub_auth_rule_id
  storage_account_id               = var.archive_storage_id
}
