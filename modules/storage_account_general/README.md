# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_containers"></a> [containers](#input\_containers) | List of containers to create in the storage account. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the resources. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all resources in the landing zone. | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix for the storage account name. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the storage account. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_containers"></a> [containers](#output\_containers) | List of containers in the general storage account. |
| <a name="output_id"></a> [id](#output\_id) | ID of the general storage account. |
| <a name="output_name"></a> [name](#output\_name) | Name of the general storage account. |
<!-- END_TF_DOCS -->
