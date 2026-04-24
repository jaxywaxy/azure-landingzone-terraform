<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_description"></a> [description](#input\_description) | Description for the assignment | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name for the assignment | `string` | `null` | no |
| <a name="input_enforce"></a> [enforce](#input\_enforce) | Whether to enforce the policy | `bool` | `true` | no |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | Management group ID (required for management\_group scope) | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the policy assignment | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Policy parameters | `map(any)` | `{}` | no |
| <a name="input_policy_definition_id"></a> [policy\_definition\_id](#input\_policy\_definition\_id) | ID of the policy definition to assign | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID (required for resource\_group scope) | `string` | `null` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | Scope of the policy assignment: subscription, management\_group, or resource\_group | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID (required for subscription scope) | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_assignment_id"></a> [assignment\_id](#output\_assignment\_id) | The resource ID of the policy assignment, if it exists. |
<!-- END_TF_DOCS -->
