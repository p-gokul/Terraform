data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "test_lambda" {

#   filename      = "lambda_function_payload.zip"
  function_name = "cron_lambda"
  role          = aws_iam_role.lambda_exec.arn
  runtime = "nodejs22.x"
   handler       = "index.handler"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}