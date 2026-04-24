output "id" {
  description = "ID of the general storage account."
  value       = azurerm_storage_account.general.id
}

output "name" {
  description = "Name of the general storage account."
  value       = azurerm_storage_account.general.name
}

output "containers" {
  description = "List of containers in the general storage account."
  value       = keys(azurerm_storage_container.containers)
}
