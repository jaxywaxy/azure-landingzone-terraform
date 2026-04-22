# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [azurerm_network_watcher.nw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |
| [azurerm_network_watcher_flow_log.flow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | Resource ID of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_law_workspace_id"></a> [law\_workspace\_id](#input\_law\_workspace\_id) | Workspace ID (GUID) of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region for Network Watcher and Flow Logs. | `string` | n/a | yes |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Map of NSG names to their resource IDs for enabling flow logs. | `map(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix used for naming Network Watcher resources. | `string` | n/a | yes |
| <a name="input_rg_networking"></a> [rg\_networking](#input\_rg\_networking) | Resource group where Network Watcher will be deployed. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Resource ID of the storage account used for NSG flow logs. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to supported resources (Network Watcher does not support tags). | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_flow_log_ids"></a> [flow\_log\_ids](#output\_flow\_log\_ids) | A map of NSG identifiers to their corresponding flow log resource IDs. |
| <a name="output_flow_log_names"></a> [flow\_log\_names](#output\_flow\_log\_names) | A map of NSG identifiers to flow log names. |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | The ID of the Network Watcher instance. |
<!-- END_TF_DOCS -->
