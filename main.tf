
module "iam" {
  source = "./modules/iam"
}
module "lambda_function_ConnectHandler" {
  table              = module.iam.aws_dynamodb_table_id
  role               = module.iam.lambda_connection_iam_role
  source             = "./modules/lambda"
  function_name      = "ConnectHandler"
  function_handler   = "index.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/ConnectHandler/index.js"
  function_out_path  = "./lambda_file/ConnectHandler/index.zip"
  dependency         = [module.iam.lambda_connection_iam_role,
                        module.iam.lambda_connection_iam_policy]
}

module "lambda_function_DefaultHandler" {
  table              = module.iam.aws_dynamodb_table_id
  role               = module.iam.lambda_default_handler_iam_role
  source             = "./modules/lambda"
  function_name      = "DefaultHandler"
  function_handler   = "index.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/Default/index.js"
  function_out_path  = "./lambda_file/Default/index.zip"
  dependency         = [module.iam.lambda_default_handler_iam_role,
                        module.iam.lambda_default_handler_iam_policy]
}

module "lambda_function_DisconnectHandler" {
  table              = module.iam.aws_dynamodb_table_id
  role               = module.iam.lambda_disconnect_handler_iam_role
  source             = "./modules/lambda"
  function_name      = "DisconnectHandler"
  function_handler   = "index.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/Disconnect/index.js"
  function_out_path  = "./lambda_file/Disconnect/index.zip"
  dependency         = [module.iam.lambda_disconnect_handler_iam_role,
                        module.iam.lambda_disconnect_handler_iam_policy]
}

module "lambda_function_SendMessageHandler" {
  table              = module.iam.aws_dynamodb_table_id
  role               = module.iam.lambda_message_handler_iam_role
  source             = "./modules/lambda"
  function_name      = "SendMessageHandler"
  function_handler   = "index.handler"
  function_runtime   = "nodejs14.x"
  function_code_path = "./lambda_file/SendMess/index.js"
  function_out_path  = "./lambda_file/SendMess/index.zip"
  dependency         = [module.iam.lambda_message_handler_iam_role,
                        module.iam.lambda_message_handler_iam_policy]
}