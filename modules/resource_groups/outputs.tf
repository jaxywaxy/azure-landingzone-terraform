output "platform_name" {
  description = "Name of the platform resource group."
  value       = azurerm_resource_group.platform.name
}

output "networking_name" {
  description = "Name of the networking resource group."
  value       = azurerm_resource_group.networking.name
}

output "apps_name" {
  description = "Name of the apps resource group."
  value       = azurerm_resource_group.apps.name
}

output "logging_name" {
  description = "Name of the logging resource group."
  value       = azurerm_resource_group.logging.name
}
