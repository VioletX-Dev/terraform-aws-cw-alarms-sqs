resource "aws_cloudwatch_metric_alarm" "sqs_messages_age" {
  for_each = var.sqs_names

  ## metric
  namespace   = "AWS/SQS"
  metric_name = "ApproximateAgeOfOldestMessage"
  dimensions = {
    QueueName = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 10
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-messages-age"
  alarm_description = "Messages in ${each.value} are older than 10 seconds. Normal is less than 1 second."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]
}
