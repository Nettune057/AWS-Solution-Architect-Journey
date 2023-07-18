output "dynamoDB_arn" {
  description = "arn of dynamoDB"
  value = aws_dynamodb_table.ws_messenger_dynamodb.arn
}

output "dynamoDB_id" {
  description = "id of dynamoDB"
  value = aws_dynamodb_table.ws_messenger_dynamodb.id
}