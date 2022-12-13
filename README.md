<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sns"></a> [sns](#module\_sns) | cloudposse/sns-topic/aws | 0.20.1 |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_permission.with_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sns_lambda"></a> [create\_sns\_lambda](#input\_create\_sns\_lambda) | anable creating for sns and lambda permision | `bool` | `true` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | ARN of lambda function | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_sns_content_based_deduplication"></a> [sns\_content\_based\_deduplication](#input\_sns\_content\_based\_deduplication) | Whether or not to create a FIFO (first-in-first-out) queue | `bool` | `false` | no |
| <a name="input_sns_delivery_policy"></a> [sns\_delivery\_policy](#input\_sns\_delivery\_policy) | The SNS delivery policy as JSON. | `any` | `null` | no |
| <a name="input_sns_fifo_topic"></a> [sns\_fifo\_topic](#input\_sns\_fifo\_topic) | Whether or not to create a FIFO (first-in-first-out) topic | `bool` | `false` | no |
| <a name="input_sns_redrive_policy"></a> [sns\_redrive\_policy](#input\_sns\_redrive\_policy) | The SNS redrive policy as JSON. This overrides `var.redrive_policy_max_receiver_count` and the `deadLetterTargetArn` (supplied by `var.fifo_queue = true`) passed in by the module. | `any` | `null` | no |
| <a name="input_sns_redrive_policy_max_receiver_count"></a> [sns\_redrive\_policy\_max\_receiver\_count](#input\_sns\_redrive\_policy\_max\_receiver\_count) | The number of times a message is delivered to the source queue before being moved to the dead-letter queue. When the ReceiveCount for a message exceeds the maxReceiveCount for a queue, Amazon SQS moves the message to the dead-letter-queue. | `number` | `5` | no |
| <a name="input_sns_sns_topic_policy_json"></a> [sns\_sns\_topic\_policy\_json](#input\_sns\_sns\_topic\_policy\_json) | The fully-formed AWS policy as JSON | `any` | `null` | no |
| <a name="input_sns_sqs_dlq_enabled"></a> [sns\_sqs\_dlq\_enabled](#input\_sns\_sqs\_dlq\_enabled) | Enable delivery of failed notifications to SQS and monitor messages in queue. | `bool` | `false` | no |
| <a name="input_sns_subscribers"></a> [sns\_subscribers](#input\_sns\_subscribers) | type = map(object({<br>    protocol = string<br>    # The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported, see below) (email is an option but is unsupported, see below).<br>    endpoint = string<br>    # The endpoint to send data to, the contents will vary with the protocol. (see below for more information)<br>    endpoint\_auto\_confirms = bool<br>    # Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)<br>    raw\_message\_delivery = bool<br>    # Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) (default is false)<br>}))<br>Required configuration for subscibres to SNS topic | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_arn"></a> [sns\_arn](#output\_sns\_arn) | output of arn to sns created |
| <a name="output_sns_name"></a> [sns\_name](#output\_sns\_name) | output of arn to sns created |
<!-- END_TF_DOCS -->