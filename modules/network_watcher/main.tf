resource "azurerm_network_watcher" "nw" {
  name                = "${var.prefix}-networkwatcher"
  location            = var.location
  resource_group_name = var.rg_networking
}

resource "azurerm_network_watcher_flow_log" "flow" {
  for_each = var.nsg_ids

  name                      = "${each.key}-flowlog"
  network_watcher_name      = azurerm_network_watcher.nw.name
  resource_group_name       = var.rg_networking
  network_security_group_id = each.value

  storage_account_id = var.storage_account_id
  enabled            = true

  retention_policy {
    enabled = true
    days    = 30
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = var.law_workspace_id
    workspace_region      = var.location
    workspace_resource_id = var.law_id
  }
}
