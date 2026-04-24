
locals {
  is_subscription     = var.scope == "subscription"
  is_management_group = var.scope == "management_group"
  is_resource_group   = var.scope == "resource_group"
}

# ---------------------------------------------------------
# Subscription-level assignment
# ---------------------------------------------------------
resource "azurerm_subscription_policy_assignment" "this" {
  count = local.is_subscription ? 1 : 0

  name                 = var.name
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id
  description          = var.description
  display_name         = var.display_name
  parameters           = jsonencode(var.parameters)
  enforce              = var.enforce
}

# ---------------------------------------------------------
# Management Group-level assignment
# ---------------------------------------------------------
resource "azurerm_management_group_policy_assignment" "this" {
  count = local.is_management_group ? 1 : 0

  name                 = var.name
  policy_definition_id = var.policy_definition_id
  management_group_id  = var.management_group_id
  description          = var.description
  display_name         = var.display_name
  parameters           = jsonencode(var.parameters)
  enforce              = var.enforce
}
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
# ---------------------------------------------------------
# Resource Group-level assignment
# ---------------------------------------------------------
resource "azurerm_resource_group_policy_assignment" "this" {
  count = local.is_resource_group ? 1 : 0

  name                 = var.name
  policy_definition_id = var.policy_definition_id
  resource_group_id    = var.resource_group_id
  description          = var.description
  display_name         = var.display_name
  parameters           = jsonencode(var.parameters)
  enforce              = var.enforce
}
