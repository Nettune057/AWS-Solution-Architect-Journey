variable "aws_apigatewayv2_api_name" {
  description = "Name of the web socket api"
  default = "tung-socket-api"
  type = string
}
variable "aws_apigatewayv2_api_protocol" {
  description = "protocol of the web socket api"
  default = "WEBSOCKET"
  type = string
}
