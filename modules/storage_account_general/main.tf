resource "azurerm_storage_account" "general" {
  name                     = "${var.prefix}${var.suffix}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  shared_access_key_enabled       = true 
  default_to_oauth_authentication = true
  public_network_access_enabled   = true
  min_tls_version                 = "TLS1_2"

  blob_properties {}
  queue_properties {}

  network_rules {
  default_action = "Allow"
  bypass         = ["AzureServices", "Logging", "Metrics"] 
  }
  tags = var.tags
}

resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.containers)
  name                  = each.value
  storage_account_name  = azurerm_storage_account.general.name
  container_access_type = "private"
}
