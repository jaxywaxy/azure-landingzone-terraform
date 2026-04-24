terraform {
  required_version = ">= 1.6.0"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.prefix}-law"
  location            = var.location
  resource_group_name = var.rg_logging
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}
