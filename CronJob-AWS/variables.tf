variable "aws_region" {
  default = "ap-northeast-1"
}

variable "lambda_role_name" {
  default = "test-lambda-role"
}

variable "eventbridge_role_name" {
  default = "test-eventbridge-role"
}

variable "eventbridge_rule_name" {
  default = "cronjob"
}