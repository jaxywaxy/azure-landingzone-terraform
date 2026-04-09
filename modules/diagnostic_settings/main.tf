locals {
  storage_supported_logs = [] # Storage has no log categories in the new API

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

  supported_logs = (
    can(regex("^Microsoft\\.Storage", var.resource_type)) ? local.storage_supported_logs :
    can(regex("^Microsoft\\.KeyVault", var.resource_type)) ? local.keyvault_supported_logs :
    can(regex("^Microsoft\\.Network/networkSecurityGroups", var.resource_type)) ? local.nsg_supported_logs :
    can(regex("^Microsoft\\.Network/virtualNetworks", var.resource_type)) ? local.vnet_supported_logs :
    var.logs
  )

  filtered_logs = [
    for log in var.logs : log
    if contains(local.supported_logs, log)
  ]

  filtered_metrics = [
    for m in var.metrics : m
    if m != null
  ]
}