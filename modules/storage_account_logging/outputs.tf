output "id" {
  description = "The resource ID of the storage account used for logging."
  value       = azurerm_storage_account.logging.id
}

output "name" {
  description = "The name of the storage account used for logging."
  value       = azurerm_storage_account.logging.name
}

output "logs_container_name" {
  description = "The name of the container used for logging."
  value       = azurerm_storage_container.logs.name
}
