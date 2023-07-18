variable "lambda_connection_handler_iam_policy_name" {
  description = "name for conenection policy"
  type = string
  default = "LambdaConnectionHandler"
}

variable "lambda_connection_handler_iam_policy_path" {
  description = "path for connection policy"
  type = string
  default = "/"
}

variable "lambda_connection_iam_role_name" {
  description = "name for connection role"
  type = string
  default = "LambdaConnection"
}

variable "lambda_default_handler_iam_policy_name" {
  description = "name for default policy"
  type = string
  default = "LambdaDefaultHandler"
}

variable "lambda_default_handler_iam_policy_path" {
  description = "path for default policy"
  type = string
  default = "/"
}

variable "lambda_default_handler_iam_role_name" {
  description = "name for default role"
  type = string
  default = "LambdaDefault"
}

variable "lambda_disconnection_handler_iam_policy_name" {
  description = "name for disconnect policy"
  type = string
  default = "LambdaDisconnectionHandler"
}

variable "lambda_disconnect_handler_iam_policy_path" {
  description = "path for disconnect policy"
  type = string
  default = "/"
}

variable "lambda_disconnect_handler_iam_role_name" {
  description = "name for disconnect role"
  type = string
  default = "LambDisconnectHandler"
}

variable "lambda_manage_connection_iam_policy_name" {
  description = "name for lambda policy"
  type = string
  default = "LambdaManageConnection"
}

variable "lambda_manage_connection_iam_policy_path" {
  description = "path for lambda policy"
  type = string
  default = "/"
}

variable "lambda_message_handler_iam_policy_name" {
  description = "name for lambda policy"
  type = string
  default = "LambdaMessageHandler"
}

variable "lambda_message_handler_iam_policy_path" {
  description = "path for lambda policy"
  type = string
  default = "/"
}
variable "lambda_message_handler_iam_role_name" {
  description = "name for lambda role"
  type = string
  default = "LambdaMessageHandler"
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
