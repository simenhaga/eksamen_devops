resource "aws_sns_topic" "alarms" {
  name = "alarm-topic-${var.candidate_id}"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol  = "email"
  endpoint  = var.candidate_email
}

resource "aws_cloudwatch_metric_alarm" "cartoverfive" {
  alarm_name                = "carts-can-not-over-five"
  namespace                 = "1011"
  metric_name               = "cart_count.value"

  comparison_operator       = "GreaterThanThreshold"
  threshold                 = "5"
  evaluation_periods        = "3"
  period                    = "300"

  statistic                 = "Maximum"

  alarm_description         = "Carts can not be over 5, three times in 5 minutes"
  insufficient_data_actions = []
  alarm_actions       = [aws_sns_topic.alarms.arn]
}