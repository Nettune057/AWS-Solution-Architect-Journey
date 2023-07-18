output "aws_iam_role" {
  value = aws_iam_role.ws_messenger_api_gateway_role.arn
}

output "lambda_connection_iam_role" {
  value = aws_iam_role.ws_messenger_lambda_connection_handler_role.arn
}

output "lambda_default_handler_iam_role" {
  value = aws_iam_role.ws_messenger_lambda_disconnection_handler_role.arn
}

output "lambda_disconnect_handler_iam_role" {
  value = aws_iam_role.ws_messenger_lambda_disconnection_handler_role.arn
}

output "lambda_message_handler_iam_role" {
  value = aws_iam_role.ws_messenger_lambda_message_handler_role.arn
}

output "lambda_connection_iam_policy" {
  value = aws_iam_policy.ws_messenger_lambda_connection_handler_policy.arn
}

output "lambda_default_handler_iam_policy" {
  value = aws_iam_policy.ws_messenger_lambda_disconnection_handler_policy.arn
}

output "lambda_disconnect_handler_iam_policy" {
  value = aws_iam_policy.ws_messenger_lambda_disconnection_handler_policy.arn
}

output "lambda_message_handler_iam_policy" {
  value = aws_iam_policy.ws_messenger_lambda_message_handler_policy.arn
}

output "aws_dynamodb_table" {
  value = module.dynamoDB.dynamoDB_arn
}

output "aws_dynamodb_table_id" {
  value = module.dynamoDB.dynamoDB_id  
}