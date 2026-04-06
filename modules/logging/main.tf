variable "location" {
  type = string
}

variable "rg_platform" {
  type = string
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-personal"
  location            = var.location
  resource_group_name = var.rg_platform
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

