resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.prefix}-law"
  location            = var.location
  resource_group_name = var.rg_logging
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_storage_account" "logs" {
  name                     = "${var.prefix}logstore"
  resource_group_name      = var.rg_logging
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = false
  blob_properties {
    versioning_enabled       = false
    change_feed_enabled      = false
    last_access_time_enabled = true
  }

  tags = var.tags
}
resource "azurerm_storage_management_policy" "logs" {
  storage_account_id = azurerm_storage_account.logs.id

  rule {
    name    = "log-lifecycle"
    enabled = true

    filters {
      prefix_match = ["logs/"]
      blob_types   = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than = 30
        tier_to_archive_after_days_since_modification_greater_than = 90
        delete_after_days_since_modification_greater_than = 180
      }
    }
  }
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_name  = azurerm_storage_account.logs.name
  container_access_type = "private"
}
