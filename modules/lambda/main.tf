data "archive_file" "function_code" {
  type        = "zip"
  source_file = var.function_code_path
  output_path = "${path.module}/function_code.zip"
}

resource "aws_lambda_function" "ws_messenger_lambda" {
  role = var.role
  function_name    = var.function_name
  handler          = var.function_handler
  runtime          = var.function_runtime
  filename         = data.archive_file.function_code.output_path
  source_code_hash = filebase64sha256(data.archive_file.function_code.output_path)
}

resource "aws_cloudwatch_log_group" "ws_messenger_logs" {
  name              = "/aws/lambda/${aws_lambda_function.ws_messenger_lambda.function_name}"
  retention_in_days = 30
}