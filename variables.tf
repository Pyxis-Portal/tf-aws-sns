variable "name" {
  type        = string
  description = <<-EOT
    ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.
    This is the only ID element not also included as a `tag`.
    The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input.
    EOT
}

variable "namespace" {
  type        = string
  default     = null
  description = "ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique"
}

variable "sns_fifo_topic" {
  type        = bool
  description = "Whether or not to create a FIFO (first-in-first-out) topic"
  default     = false
}

variable "sns_delivery_policy" {
  type        = any
  default     = null
  description = "The SNS delivery policy as JSON."
}

variable "sns_content_based_deduplication" {
  type        = bool
  default     = false
  description = "Whether or not to create a FIFO (first-in-first-out) queue"
}

variable "sns_subscribers" {
  type        = any
  default     = null
  description = <<-EOT
    type = map(object({
        protocol = string
        # The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported, see below) (email is an option but is unsupported, see below).
        endpoint = string
        # The endpoint to send data to, the contents will vary with the protocol. (see below for more information)
        endpoint_auto_confirms = bool
        # Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)
        raw_message_delivery = bool
        # Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) (default is false)
    }))
    Required configuration for subscibres to SNS topic
    EOT
}

variable "sns_sqs_dlq_enabled" {
  type        = bool
  default     = false
  description = "Enable delivery of failed notifications to SQS and monitor messages in queue."
}

variable "sns_redrive_policy" {
  type        = any
  default     = null
  description = "The SNS redrive policy as JSON. This overrides `var.redrive_policy_max_receiver_count` and the `deadLetterTargetArn` (supplied by `var.fifo_queue = true`) passed in by the module."
}

variable "sns_redrive_policy_max_receiver_count" {
  type        = number
  default     = 5
  description = "The number of times a message is delivered to the source queue before being moved to the dead-letter queue. When the ReceiveCount for a message exceeds the maxReceiveCount for a queue, Amazon SQS moves the message to the dead-letter-queue."
}

variable "sns_sns_topic_policy_json" {
  type        = any
  default     = null
  description = "The fully-formed AWS policy as JSON"
}

variable "create_sns_lambda" {
  type        = bool
  default     = true
  description = "anable creating for sns and lambda permision"
}

variable "lambda_function_name" {
  type        = list(string)
  default     = [""]
  description = "ARN of lambda function"
}


