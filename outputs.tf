output "sns_arn" {
  value       = element(concat(module.sns.*.sns_topic_arn, [""]), 0)
  description = "output of arn to sns created"
}

output "sns_name" {
  value       = element(concat(module.sns.*.sns_topic_name, [""]), 0)
  description = "output of arn to sns created"
}
