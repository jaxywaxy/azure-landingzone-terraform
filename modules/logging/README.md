# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_location"></a> [location](#input\_location) | Azure region for logging resources. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix used for naming logging resources. | `string` | n/a | yes |
| <a name="input_rg_logging"></a> [rg\_logging](#input\_rg\_logging) | Resource group where logging resources will be deployed. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to supported logging resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_law_id"></a> [law\_id](#output\_law\_id) | n/a |
| <a name="output_law_name"></a> [law\_name](#output\_law\_name) | n/a |
<!-- END_TF_DOCS -->
