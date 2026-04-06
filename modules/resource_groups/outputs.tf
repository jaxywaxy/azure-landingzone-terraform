output "platform_name" {
  value = azurerm_resource_group.platform.name
}

output "networking_name" {
  value = azurerm_resource_group.networking.name
}

output "apps_name" {
  value = azurerm_resource_group.apps.name
}

output "logging_name" {
  value = azurerm_resource_group.logging.name
}
