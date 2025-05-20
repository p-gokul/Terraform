resource "aws_cloudwatch_event_rule" "every_minute" {
  name                = var.eventbridge_rule_name
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.every_minute.name
  arn       = aws_lambda_function.test_lambda.arn
  role_arn  = aws_iam_role.eventbridge_invoke_lambda.arn
}