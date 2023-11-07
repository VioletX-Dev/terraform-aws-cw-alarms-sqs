variable "alarm_notification_channel" {
  description = "It's a SNS that might send emails, page your Incident Response tool (Pager Duty, OpsGenie, VitorOps, etc)"
  type        = string
}

variable "sqs_names" {
  description = "SQS queue names to create the alarms. `e.g. sqs_names = [\"queue_1\", \"queue_2\", \"queue_3\"]`"
  type        = set(string)
  ## e.g. sqs_names = ["queue_1", "queue_2", "queue_3"]
}
