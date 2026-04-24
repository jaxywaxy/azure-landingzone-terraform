# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the resources. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all resources in the landing zone. | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the storage account. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the storage account used for logging. |
| <a name="output_logs_container_name"></a> [logs\_container\_name](#output\_logs\_container\_name) | The name of the container used for logging. |
| <a name="output_name"></a> [name](#output\_name) | The name of the storage account used for logging. |
<!-- END_TF_DOCS -->
