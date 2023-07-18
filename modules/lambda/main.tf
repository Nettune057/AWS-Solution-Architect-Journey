data "archive_file" "function_code" {
  type        = "zip"
  source_file = var.function_code_path
  output_path = var.function_out_path
}

resource "aws_lambda_function" "ws_messenger_lambda" {
  role = var.role
  function_name    = var.function_name
  handler          = var.function_handler
  runtime          = var.function_runtime
  filename         = data.archive_file.function_code.output_path
  source_code_hash = filebase64sha256(data.archive_file.function_code.output_path)
  depends_on       = [var.dependency]

  environment {
    variables = {
      table = var.table
    }
  }
}
