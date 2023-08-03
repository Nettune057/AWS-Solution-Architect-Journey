variable "setup_name" {
    default = "ECS"
}
variable "env" {
    default = "dev"
}
variable "cidr_blocks" {
    default = "10.0.0.0/16"
}
variable "cidr_block_pub2a" {
    default = "10.0.0.0/24"
}
variable "cidr_block_pub2b" {
    default = "10.0.1.0/24"
}
variable "cidr_block_pri2a" {
    default = "10.0.2.0/24"
}
variable "cidr_block_pri2b" {
    default = "10.0.3.0/24"
}
variable "vpc_name" {
    default = "vpc"
}
variable "az_2a" {
    default = "us-east-2a"
}
variable "az_2b" {
    default = "us-east-2b"
}
variable "aws_subnet_pub_2a" {
    default = "public-2a"
}
variable "aws_subnet_pub_2b" {
    default = "public-2b"
}
variable "nat_2a" {
    default = "nat-2a"
}
variable "nat_2b" {
    default = "nat-2b"
}
variable "public_RT" {
    default = "public-RT"
}
variable "private_RT_2a" {
    default = "private-RT-2a"
}
variable "private_RT_2b" {
    default = "private-RT-2b"
}
variable "private_2a" {
    default = "private-2a"
}
variable "private_2b"{
    default = "private-2b"
}
variable "IGW" {
    default = "IGW"
}

variable "security_groups_name" {
    default = "SG"
}
variable "alb_name" {
    default = "alb"
}
variable "alb_type" {
    default = "application"
}

variable "target_name" {
    default = "target"
}


variable "protocol" {
    default = "HTTP"
}

variable "target_type" {
    default = "ip"
}

variable "ecs_name"{
    default = "ECS"
}

variable "asg_name" {
    default = "ASG"
}

variable "capacity_provider_name" {
    default = "capacity_provider"
}

variable "ecs_cluster_name" {
    default = "ECS"
}



variable "policy_name" {
    default = "ECSPolicy"
}

variable "ecs_role_name" {
    default = "ECSRole"
}

variable "instance_role_name" {
    default = "IntanceRole"
}

variable "instance_type" {
    default = "t2.large"
}

variable "image_id" {
    default = "ami-0de5ed5b8d5233741"
}

variable "desired_capacity" {
    default = 2
}

variable "min_size" {
    default = 1
}

variable "max_size" {
    default =  3
}

variable "health_check_grace_period" {
    default = 300
}

variable "health_check_type" {
    default = "EC2"
}

variable "requires_compatibilities" {
    default = "EC2"
}

variable "launch_type" {
    default = "EC2"
}

variable "family" {
    default = "taskdefinition"
}

variable "network_mode" {
    default = "awsvpc"
}

variable "cpu" {
    default = 512
}

variable "memory" {
    default = 1024
}

variable "operating_system_family" {
    default = "LINUX"
}
variable "cpu_architecture" {
    default = "X86_64"
}

variable "service_name" {
    default = "service"
}

variable "desired_count" {
    default = 2
}

variable "container_name" {
    default = "container"
}

variable "container_port" {
    default = 3000
}

variable "platform_version" {
    default = null
}

variable "assign_public_ip" {
    type = bool
    default = false
}

