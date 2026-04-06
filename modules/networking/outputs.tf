output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "apps_vnet_id" {
  value = azurerm_virtual_network.apps.id
}

