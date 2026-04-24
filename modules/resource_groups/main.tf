terraform {
  required_version = ">= 1.6.0"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.100"
    }
  }
}
resource "azurerm_resource_group" "platform" {
  name     = "${var.prefix}-rg-platform"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "networking" {
  name     = "${var.prefix}-rg-networking"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "apps" {
  name     = "${var.prefix}-rg-apps"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "logging" {
  name     = "${var.prefix}-rg-logging"
  location = var.location
  tags     = var.tags
}
