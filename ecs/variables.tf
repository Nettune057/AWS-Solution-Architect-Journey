variable "policy_name" {}
variable "ecs_role_name" {}
variable "ecs_cluster_name" {}
variable "path" {
    default = "/"
}
variable "instance_role_name" {}
variable "image_id" {}
variable "user_data" {}
variable "instance_type" {}
variable "vpc_zone" {}
variable "security_groups" {}
variable "asg_name"{}
variable "desired_capacity" {}
variable "capacity_provider_name" {}
variable "min_size" {}
variable "max_size" {}
variable "health_check_grace_period" {}
variable "health_check_type" {}

variable "alb_name" {}
variable "alb_association" {}
variable "subnets" {}

variable "family" {}
variable "network_mode" {}
variable "cpu" {}
variable "memory" {}
variable "requires_compatibilities" {}
variable "operating_system_family" {}
variable "cpu_architecture" {}


variable "service_name" {}
variable "desired_count" {}
variable "container_name" {}
variable "container_port" {}
variable "launch_type" {}
variable "platform_version" {}
variable "assign_public_ip" {
    type = bool
}