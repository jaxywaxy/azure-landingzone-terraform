terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"   # or latest stable
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate18396"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}


data "azurerm_client_config" "current" {}

module "resource_groups" {
  source   = "../../modules/resource_groups"
  prefix   = var.prefix
  location = var.location
  tags     = var.tags
}

module "networking" {
  source     = "../../modules/networking"
  prefix     = var.prefix
  location   = var.location
  rg_network = module.resource_groups.networking_name
  tags       = var.tags
}

module "logging" {
  source     = "../../modules/logging"
  prefix     = var.prefix
  location   = var.location
  rg_logging = module.resource_groups.logging_name
  tags       = var.tags
}

module "storage_diagnostics" {
  source = "../../modules/diagnostic_settings"

  resource_name      = module.logging.logs_storage_name
  resource_type      = "Microsoft.Storage/storageAccounts"
  target_resource_id = module.logging.logs_storage_id
  law_id             = module.logging.law_id

  logs = []
  metrics = [
   "Transaction",
   "Capacity"
 ]
}
module "tags" {
  source = "../../modules/tags"

  environment       = "prod"
  global_tags       = var.global_tags
  environment_tags  = var.environment_tags
  resource_tags     = {}
}
