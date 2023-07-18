variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "function_handler" {
  description = "Lambda function handler"
  type        = string
}

variable "function_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "function_code_path" {
  description = "Path to the code file for the Lambda function"
  type        = string
}

variable "function_out_path" {
  description = "Path to the zip file for Lambda function"
  type        = string
}

variable "role" {
  type        = string
}

variable "dependency" {
  type = list
}

variable "table" {
  type = string
}