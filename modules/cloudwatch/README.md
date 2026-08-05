<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_cloudwatch_dashboard.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Whether alarm actions are enabled. | `bool` | `true` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | SNS topics or other actions executed when alarm enters ALARM state. | `list(string)` | `[]` | no |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | Description of the CloudWatch Metric Alarm. | `string` | `""` | no |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | Name of the CloudWatch Metric Alarm. | `string` | n/a | yes |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | Comparison operator. | `string` | n/a | yes |
| <a name="input_create_dashboard"></a> [create\_dashboard](#input\_create\_dashboard) | Create CloudWatch Dashboard. | `bool` | `false` | no |
| <a name="input_dashboard_body"></a> [dashboard\_body](#input\_dashboard\_body) | Dashboard JSON. | `string` | `"{}"` | no |
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | CloudWatch dashboard name. | `string` | `""` | no |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | Metric dimensions. | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | Number of evaluation periods. | `number` | `2` | no |
| <a name="input_insufficient_data_actions"></a> [insufficient\_data\_actions](#input\_insufficient\_data\_actions) | Actions executed when alarm enters INSUFFICIENT\_DATA. | `list(string)` | `[]` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Name of the CloudWatch Log Group. | `string` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | CloudWatch metric name. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | CloudWatch namespace. | `string` | `"AWS/EC2"` | no |
| <a name="input_ok_actions"></a> [ok\_actions](#input\_ok\_actions) | Actions executed when alarm returns to OK. | `list(string)` | `[]` | no |
| <a name="input_period"></a> [period](#input\_period) | Metric collection period in seconds. | `number` | `300` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Retention period for CloudWatch logs. | `number` | `30` | no |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | CloudWatch statistic. | `string` | `"Average"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional resource tags. | `map(string)` | `{}` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | Alarm threshold. | `number` | `80` | no |
| <a name="input_treat_missing_data"></a> [treat\_missing\_data](#input\_treat\_missing\_data) | How CloudWatch treats missing data. | `string` | `"missing"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_dashboard_arn"></a> [dashboard\_arn](#output\_dashboard\_arn) | CloudWatch Dashboard ARN. |
| <a name="output_dashboard_name"></a> [dashboard\_name](#output\_dashboard\_name) | CloudWatch Dashboard name. |
| <a name="output_log_group_arn"></a> [log\_group\_arn](#output\_log\_group\_arn) | ARN of the CloudWatch Log Group. |
| <a name="output_log_group_id"></a> [log\_group\_id](#output\_log\_group\_id) | ID of the CloudWatch Log Group. |
| <a name="output_metric_alarm_arn"></a> [metric\_alarm\_arn](#output\_metric\_alarm\_arn) | ARN of the CloudWatch Metric Alarm. |
| <a name="output_metric_alarm_id"></a> [metric\_alarm\_id](#output\_metric\_alarm\_id) | ID of the CloudWatch Metric Alarm. |
<!-- END_TF_DOCS -->
