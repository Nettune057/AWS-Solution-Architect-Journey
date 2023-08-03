variable "alb_name" {}
variable "alb_type" {}
variable "subnets" {}
variable "target_name" {}
variable "port" {
    default = "80"
}
variable "vpc_id" {}
variable "container_port" {}
variable "protocol" {}
variable "target_type" {}
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