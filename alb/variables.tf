variable "alb_name" {}
variable "alb_type" {}
variable "subnets" {}
variable "tarname" {}
variable "port" {
    default = "80"
}
variable "vpc_id" {}
variable "another_port" {}
variable "protocol" {}
variable "tartype" {}
variable "healthy_threshold" {
    default = 3
}
variable "interval" {
    default = 30
}
variable "matcher" {
    default = "200"
}
variable "path" {
    default = "/"
}
variable "listener_action" {
    default = "forward"
}

variable "security_groups" {}