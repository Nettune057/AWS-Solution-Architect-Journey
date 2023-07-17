variable "dynamodb_name" {
  description = "name of the dynamodb"
  default = "product"
  type = string
}

variable "billing_mode" {
    description = "billing mode of the dynamodb"
    default = "PAY_PER_REQUEST"
    type = string
}

variable "hash_key" {
    description = "hash key of dynamodb"
    default = "UserId"
    type = string
}

variable "write_capacity" {
    description = "write_capacity of dynamodb"
    type = number
    default = 5
}

variable "read_capacity" {
  description = "read_capacity of dynamodb"
  type = number
  default = 5
}