variable "cidr_blocks" {}
variable "vpc_name" {}
variable "az_2a" {}
variable "az_2b" {}
variable "security_groups_name" {}
variable "aws_subnet_pub_2a" {}
variable "aws_subnet_pub_2b" {}
variable "nat_2a" {}
variable "nat_2b" {}
variable "public_RT" {}
variable "private_RT_2a" {}
variable "private_RT_2b" {}
variable "private_2b" {}
variable "private_2a" {}
variable "IGW" {}
variable "domain" {
    default = "vpc"
}
variable "route_cidr_block" {
    default = "0.0.0.0/0"
}
variable "cidr_block_pub2a" {}
variable "cidr_block_pub2b" {}
variable "cidr_block_pri2a" {}
variable "cidr_block_pri2b" {}