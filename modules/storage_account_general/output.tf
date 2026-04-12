output "id" {
  value = azurerm_storage_account.general.id
}

output "name" {
  value = azurerm_storage_account.general.name
}

output "containers" {
  value = keys(azurerm_storage_container.containers)
}
