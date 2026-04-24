terraform {
  required_version = ">= 1.6.0"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
resource "azurerm_storage_account" "logging" {
  name                     = "${var.prefix}logstore"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Security
  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  public_network_access_enabled   = true
  min_tls_version                 = "TLS1_2"

  # Disable all secondary services to avoid 403 refresh errors
  blob_properties {}
  queue_properties {}

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices", "Logging", "Metrics"]
  }
  tags = var.tags
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_name  = azurerm_storage_account.logging.name
  container_access_type = "private"
}

resource "azurerm_storage_management_policy" "logs" {
  storage_account_id = azurerm_storage_account.logging.id

  rule {
    name    = "log-lifecycle"
    enabled = true

    filters {
      prefix_match = ["logs/"]
      blob_types   = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 30
        tier_to_archive_after_days_since_modification_greater_than = 90
        delete_after_days_since_modification_greater_than          = 180
      }
    }
  }
}
