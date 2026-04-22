# Module: <module-name>

<!-- BEGIN_TF_DOCS -->
## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (dev, test, prod). | `string` | n/a | yes |
| <a name="input_environment_tags"></a> [environment\_tags](#input\_environment\_tags) | Environment-specific tag overrides. | `map(string)` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Global CAF-aligned tags applied to all resources. | `map(string)` | n/a | yes |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Resource-specific tag overrides. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_tags"></a> [tags](#output\_tags) | Final merged CAF-aligned tags. |
<!-- END_TF_DOCS -->
