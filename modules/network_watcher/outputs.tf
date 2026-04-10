output "network_watcher_id" {
  description = "The ID of the Network Watcher instance."
  value       = azurerm_network_watcher.nw.id
}

output "flow_log_ids" {
  description = "A map of NSG identifiers to their corresponding flow log resource IDs."
  value       = { for k, v in azurerm_network_watcher_flow_log.flow : k => v.id }
}

output "flow_log_names" {
  description = "A map of NSG identifiers to flow log names."
  value       = { for k, v in azurerm_network_watcher_flow_log.flow : k => v.name }
}
