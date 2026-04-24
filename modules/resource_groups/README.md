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
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_apps_name"></a> [apps\_name](#output\_apps\_name) | Name of the apps resource group. |
| <a name="output_logging_name"></a> [logging\_name](#output\_logging\_name) | Name of the logging resource group. |
| <a name="output_networking_name"></a> [networking\_name](#output\_networking\_name) | Name of the networking resource group. |
| <a name="output_platform_name"></a> [platform\_name](#output\_platform\_name) | Name of the platform resource group. |
<!-- END_TF_DOCS -->
