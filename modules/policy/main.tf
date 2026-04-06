resource "azurerm_policy_assignment" "tagging" {
  name                 = "require-tags"
  scope                = var.subscription_id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/require-tag"
  parameters = jsonencode({
    tagName = { value = "owner" }
  })
}

