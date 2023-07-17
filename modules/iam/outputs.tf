output "aws_iam_role" {
  value = aws_iam_role.ws_messenger_api_gateway_role.arn
}

output "aws_lambda_function" {
  value = aws_iam_role.ws_messenger_lambda_role.arn
}

output "aws_iam_role_arn" {
  value = aws_iam_role.ws_messenger_api_gateway_role.arn
}