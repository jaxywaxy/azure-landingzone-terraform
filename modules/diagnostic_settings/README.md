# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_archive_storage_id"></a> [archive\_storage\_id](#input\_archive\_storage\_id) | Resource ID of the storage account for archiving diagnostics. | `string` | `null` | no |
| <a name="input_eventhub_auth_rule_id"></a> [eventhub\_auth\_rule\_id](#input\_eventhub\_auth\_rule\_id) | Resource ID of the Event Hub authorization rule for diagnostics to use. | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Name of the Event Hub to send diagnostics to. | `string` | `null` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | Log Analytics Workspace ID. | `string` | n/a | yes |
| <a name="input_logs"></a> [logs](#input\_logs) | Requested log categories. | `list(string)` | `[]` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | Requested metric categories. | `list(string)` | `[]` | no |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | Name of the resource for naming the diagnostic setting. | `string` | n/a | yes |
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | Azure resource type (e.g., Microsoft.Storage/storageAccounts). | `string` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | Resource ID of the target resource. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_applied_logs"></a> [applied\_logs](#output\_applied\_logs) | Logs that were actually applied after filtering. |
| <a name="output_applied_metrics"></a> [applied\_metrics](#output\_applied\_metrics) | Metrics that were actually applied after filtering. |
| <a name="output_diagnostic_setting_id"></a> [diagnostic\_setting\_id](#output\_diagnostic\_setting\_id) | ID of the diagnostic setting. |
| <a name="output_resource_type"></a> [resource\_type](#output\_resource\_type) | Resource type used for filtering. |
<!-- END_TF_DOCS -->
