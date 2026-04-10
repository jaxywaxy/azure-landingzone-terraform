resource "azurerm_virtual_network" "hub" {
  name                = "${var.prefix}-vnet-hub"
  location            = var.location
  resource_group_name = var.rg_network
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "hub_firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.rg_network
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "hub_shared" {
  name                 = "snet-shared-services"
  resource_group_name  = var.rg_network
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.10.0/24"]
}

resource "azurerm_virtual_network" "apps" {
  name                = "${var.prefix}-vnet-apps"
  location            = var.location
  resource_group_name = var.rg_network
  address_space       = ["10.1.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "apps_web" {
  name                 = "snet-web"
  resource_group_name  = var.rg_network
  virtual_network_name = azurerm_virtual_network.apps.name
  address_prefixes     = ["10.1.1.0/24"]
}
resource "azurerm_subnet" "apps_app" {
  name                 = "snet-app"
  resource_group_name  = var.rg_network
  virtual_network_name = azurerm_virtual_network.apps.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_subnet" "apps_data" {
  name                 = "snet-data"
  resource_group_name  = var.rg_network
  virtual_network_name = azurerm_virtual_network.apps.name
  address_prefixes     = ["10.1.3.0/24"]
}

resource "azurerm_virtual_network_peering" "hub_to_apps" {
  name                      = "hub-to-apps"
  resource_group_name       = var.rg_network
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.apps.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
}
resource "azurerm_virtual_network_peering" "apps_to_hub" {
  name                      = "apps-to-hub"
  resource_group_name       = var.rg_network
  virtual_network_name      = azurerm_virtual_network.apps.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
  allow_forwarded_traffic   = true
  use_remote_gateways       = false
}

