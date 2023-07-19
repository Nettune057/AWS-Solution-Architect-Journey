resource "aws_dynamodb_table" "ws_messenger_dynamodb" {
  name = var.dynamodb_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = "connectionId"
    type = "S"
  }

}