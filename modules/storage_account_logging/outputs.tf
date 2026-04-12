output "id" {
  value = azurerm_storage_account.logging.id
}

output "name" {
  value = azurerm_storage_account.logging.name
}

output "logs_container_name" {
  value = azurerm_storage_container.logs.name
}
