output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "apps_vnet_id" {
  value = azurerm_virtual_network.apps.id
}

/* output "nsg_ids" {
  value = {
    for k, nsg in azurerm_network_security_group.nsgs :
    k => nsg.id
  }
} */
