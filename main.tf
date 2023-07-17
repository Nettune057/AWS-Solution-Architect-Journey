module "iam" {
  source = "./modules/iam"
}
module "lambda_function_ConnectHandler" {
  role             = module.iam.aws_lambda_function
  source             = "./modules/lambda"
  function_name      = "ConnectHandler"
  function_handler   = "ConnectHandler.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/ConnectHandler.js"
}

module "lambda_function_DefaultHandler" {
  role             = module.iam.aws_lambda_function
  source             = "./modules/lambda"
  function_name      = "DefaultHandler"
  function_handler   = "DefaultHandler.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/DefaultHandler.js"
}

module "lambda_function_DisconnectHandler" {
  role               = module.iam.aws_lambda_function
  source             = "./modules/lambda"
  function_name      = "DisconnectHandler"
  function_handler   = "DisconnectHandler.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/DisconnectHandler.js"
}

module "lambda_function_SendMessageHandler" {
  role             = module.iam.aws_lambda_function
  source             = "./modules/lambda"
  function_name      = "SendMessageHandler"
  function_handler   = "SendMessageHandler.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/SendMessageHandler.js"
}

module "dynamodb" {
  source = "./modules/dynamoDB"
}