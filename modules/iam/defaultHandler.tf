data "aws_iam_policy_document" "ws_messenger_lambda_default_handler_policy" {
  version = "2012-10-17"
  statement {
		actions = ["execute-api:ManageConnections"]
		resources = ["arn:aws:execute-api:us-east-2:400516100932:*/*/POST/@connections/*"]
		effect = "Allow"
  }

  statement {
    actions = ["execute-api:ManageConnections"]
	resources = ["arn:aws:execute-api:us-east-2:400516100932:*/*/GET/@connections/*"]
	effect = "Allow"
  }
}

resource "aws_iam_policy" "ws_messenger_lambda_default_handler_policy" {
  name   = var.lambda_default_handler_iam_policy_name
  path   = var.lambda_default_handler_iam_policy_path
  policy = data.aws_iam_policy_document.ws_messenger_lambda_default_handler_policy.json
}

resource "aws_iam_role" "ws_messenger_lambda_default_handler_role" {
  name = var.lambda_default_handler_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [aws_iam_policy.ws_messenger_lambda_default_handler_policy.arn,"arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}
