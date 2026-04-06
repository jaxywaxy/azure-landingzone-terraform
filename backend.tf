terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate18396"
    container_name       = "tfstate"
    key                  = "landingzone.tfstate"
  }
}

