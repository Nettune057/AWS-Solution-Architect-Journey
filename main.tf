locals {
    prefix_name                 = "${var.setup_name}-${var.env}"
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER= ${module.ecs.cluster_name}>> /etc/ecs/ecs.config"
}

module "vpc" {
    source                      = "./vpc"
    cidr_blocks                 = var.cidr_blocks
    vpc_name                    = "${local.prefix_name}-${var.vpc_name}"
    aws_subnet_pub_2a           = "${local.prefix_name}-${var.aws_subnet_pub_2a}"
    aws_subnet_pub_2b           = "${local.prefix_name}-${var.aws_subnet_pub_2b}"
    nat_2a                      = "${local.prefix_name}-${var.nat_2a}"
    nat_2b                      = "${local.prefix_name}-${var.nat_2b}"
    public_RT                   = "${local.prefix_name}-${var.public_RT}"
    private_RT_2a               = "${local.prefix_name}-${var.private_RT_2a}"
    private_RT_2b               = "${local.prefix_name}-${var.private_RT_2b}"
    private_2a                  = "${local.prefix_name}-${var.private_2a}"
    private_2b                  = "${local.prefix_name}-${var.private_2b}"
    IGW                         = "${local.prefix_name}-${var.IGW}"
    security_groups_name        = "${local.prefix_name}-${var.security_groups_name}"
    cidr_block_pub2a            = var.cidr_block_pub2a
    cidr_block_pub2b            = var.cidr_block_pub2b
    cidr_block_pri2a            = var.cidr_block_pri2a
    cidr_block_pri2b            = var.cidr_block_pri2b
    az_2a                       = var.az_2a
    az_2b                       = var.az_2b
    
}

module "alb" {
    source                      = "./alb"
    alb_name                    = "${local.prefix_name}-${var.alb_name}"
    target_name                 = "${local.prefix_name}-${var.target_name}"
    subnets                     = [module.vpc.az_pub_2a,module.vpc.az_pub_2b]
    security_groups             = [module.vpc.sec_group_id]
    vpc_id                      = module.vpc.vpc_id
    alb_type                    = var.alb_type
    container_port              = var.container_port
    protocol                    = var.protocol
    target_type                 = var.target_type
}

module "ecs" {
    source                      = "./ecs"
    ecs_cluster_name            = "${local.prefix_name}-${var.ecs_cluster_name}"
    asg_name                    = "${local.prefix_name}-${var.asg_name}"
    policy_name                 = "${local.prefix_name}-${var.policy_name}"
    ecs_role_name               = "${local.prefix_name}-${var.ecs_role_name}"
    instance_role_name          = "${local.prefix_name}-${var.instance_role_name}"
    vpc_zone                    = [module.vpc.az_pri_2a,module.vpc.az_pri_2b]
    security_groups             = [module.vpc.sec_group_id]
    instance_type               = var.instance_type
    image_id                    = var.image_id
    user_data                   = local.user_data
    desired_capacity            = var.desired_capacity
    min_size                    = var.min_size
    max_size                    = var.max_size
    health_check_grace_period   = var.health_check_grace_period
    health_check_type           = var.health_check_type
    capacity_provider_name      = var.capacity_provider_name
    alb_name                    = module.alb.alb_name
    alb_association             = module.alb.target_group_arn
    subnets                     = [module.vpc.az_pri_2a,module.vpc.az_pri_2b]
    requires_compatibilities    = ["${var.requires_compatibilities}"]
    launch_type                 = var.launch_type
    family                      = "${local.prefix_name}-${var.family}"
    network_mode                = var.network_mode
    cpu                         = var.cpu
    memory                      = var.memory
    operating_system_family     = var.operating_system_family
    cpu_architecture            = var.cpu_architecture
    service_name                = "${local.prefix_name}-${var.service_name}"
    desired_count               = var.desired_count
    container_name              = "${local.prefix_name}-${var.container_name}"
    container_port              = var.container_port
    platform_version            = var.platform_version
    assign_public_ip            = var.assign_public_ip
}
