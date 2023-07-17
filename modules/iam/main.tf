
data "aws_iam_policy_document" "ws_messenger_lambda_policy" {
    version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    effect = "Allow"
    actions = ["dynamodb:PutItem"]
    resources = ["arn:aws:dynamodb:*:*:*"]
  }
}

data "aws_iam_policy_document" "ws_messenger_api_gateway_policy" {
  statement {
    actions = [
      "lambda:InvokeFunction",
    ]
    effect    = "Allow"
    resources = ["arn:aws:lambda:*:*:*"]
  }
}

# Policy and role for api gateway 
resource "aws_iam_policy" "ws_messenger_api_gateway_policy" {
  name   = var.api_iam_policy_name
  path   = var.api_iam_policy_path
  policy = data.aws_iam_policy_document.ws_messenger_api_gateway_policy.json
}

resource "aws_iam_role" "ws_messenger_api_gateway_role" {
  name = var.api_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [aws_iam_policy.ws_messenger_api_gateway_policy.arn]
}

#Policy and role for lambda
resource "aws_iam_policy" "ws_messenger_lambda_policy" {
  name   = var.lambda_iam_policy_name
  path   = var.lambda_iam_policy_path
  policy = data.aws_iam_policy_document.ws_messenger_lambda_policy.json
}

resource "aws_iam_role" "ws_messenger_lambda_role" {
  name = var.lambda_iam_role_name

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

  managed_policy_arns = [aws_iam_policy.ws_messenger_lambda_policy.arn]
}

