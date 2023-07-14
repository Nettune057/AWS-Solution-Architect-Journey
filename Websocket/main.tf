resource "aws_apigatewayv2_api" "lab" {
  name = var.aws_apigatewayv2_api_name
  protocol_type = var.aws_apigatewayv2_api_protocol
  route_selection_expression = "$request.body.action"
}