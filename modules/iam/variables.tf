variable "lambda_iam_policy_name" {
  description = "name for lambda policy"
  type = string
  default = "WsMessengerLambdaPolicy"
}

variable "lambda_iam_policy_path" {
  description = "path for lambda policy"
  type = string
  default = "/"
}

variable "lambda_iam_role_name" {
  description = "name for lambda role"
  type = string
  default = "WsMessengerLambdaRole"
}

variable "api_iam_policy_name" {
  description = "name for api gateway policy"
  type = string
  default = "WsMessengerapigatewayPolicy"
}

variable "api_iam_policy_path" {
  description = "path for api gateway policy"
  type = string
  default = "/"
}

variable "api_iam_role_name" {
  description = "name for api gateway role"
  type = string
  default = "WsMessengerapigatewayRole"
}
