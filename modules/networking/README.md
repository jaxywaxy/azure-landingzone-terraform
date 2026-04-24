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
| <a name="input_rg_network"></a> [rg\_network](#input\_rg\_network) | Name of the networking resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the networking resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_hub_vnet_id"></a> [hub\_vnet\_id](#output\_hub\_vnet\_id) | The resource ID of the hub virtual network |
<!-- END_TF_DOCS -->
