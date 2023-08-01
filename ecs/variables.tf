variable "name" {}
variable "service_role" {}
variable "alb_name" {}
variable "alb_association" {}

variable "base" {
    default = 1
}
variable "weight" {
    default = 100
}
variable "subnets" {}
variable "policy_name" {}
variable "ecs_role_name" {}
variable "vpcid" {}
variable "family" {}
variable "network_mode" {}
variable "cpu" {}
variable "memory" {}
variable "operating_system_family" {}
variable "cpu_architecture" {}
variable "ephemeral_storage" {}

variable "service_name" {}
variable "desired_count" {}
variable "container_name" {}
variable "container_port" {}

variable "security_groups" {}