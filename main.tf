locals {
  tags = {
    terraform = true
  }
}


module "sns" {
  source  = "cloudposse/sns-topic/aws"
  version = "0.20.1"

  count = var.create_sns_lambda ? 1 : 0

  name                              = var.name
  namespace                         = var.namespace
  fifo_topic                        = var.sns_fifo_topic
  delivery_policy                   = var.sns_delivery_policy
  content_based_deduplication       = var.sns_content_based_deduplication
  subscribers                       = var.sns_subscribers
  sqs_dlq_enabled                   = var.sns_sqs_dlq_enabled
  redrive_policy                    = var.sns_redrive_policy
  redrive_policy_max_receiver_count = var.sns_redrive_policy_max_receiver_count
  sns_topic_policy_json             = var.sns_sns_topic_policy_json
  encryption_enabled                = var.sns_encryption_enabled
  kms_master_key_id                 = var.sns_kms_master_key_id

  tags = merge(
    local.tags,
    var.tags,
  )
}

resource "aws_lambda_permission" "with_sns" {
  count = var.create_sns_lambda && length(var.lambda_function_name) > 0 ? length(var.lambda_function_name) : 0

  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name[count.index] # aws_lambda_function.func.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = element(concat(module.sns.*.sns_topic_arn, [""]), 0)
}