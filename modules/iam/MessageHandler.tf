data "aws_iam_policy_document" "ws_messenger_lambda_message_handler_policy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
	actions = [
		"dynamodb:BatchGetItem",
		"dynamodb:GetRecords",
		"dynamodb:GetShardIterator",
		"dynamodb:Query",
		"dynamodb:GetItem",
		"dynamodb:Scan",
		"dynamodb:ConditionCheckItem"
	]
	resources = [module.dynamoDB.dynamoDB_arn]
   }
}

resource "aws_iam_policy" "ws_messenger_lambda_message_handler_policy" {
  name   = var.lambda_message_handler_iam_policy_name
  path   = var.lambda_message_handler_iam_policy_path
  policy = data.aws_iam_policy_document.ws_messenger_lambda_message_handler_policy.json
}