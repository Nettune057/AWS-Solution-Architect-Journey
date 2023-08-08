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
    image                       = module.ecr.ecr_repository_url
}

module "ecr" {
    source                      = "./ecr"
    name                        = "${local.prefix_name}-${var.ecr_name}"
    image_tag_mutability        = var.image_tag_mutability
    force_delete                = var.force_delete
    scan_on_push                = var.scan_on_push
}

module "cicd" {
    source                      = "./cicd"
    repository_name             = "${local.prefix_name}-${var.repository_name}"
    default_branch              = var.default_branch
    codebuild_name              = "${local.prefix_name}-${var.codebuild_name}"
    build_timeout               = var.build_timeout
    queued_timeout              = var.queued_timeout
    bucket_location             = module.s3.s3_name
    cloudwatch_log_group_name   = module.monitoring.cloudwatch_log_group_name
    cloudwatch_log_stream_name  = module.monitoring.cloudwatch_log_stream_name
    s3_cicd_arn                 = module.s3.s3_arn
    log_group                   = module.monitoring.cloudwatch_log_group_arn
    codeBuildBasePolicy         = var.codeBuildBasePolicy
    codeBuildServiceRolePolicy  = var.codeBuildServiceRolePolicy
    codeBuildBatchPolicy        = var.codeBuildBatchPolicy
    codebuild_role              = "${local.prefix_name}-${var.codebuild_role}"
    codepipeline_name           = "${local.prefix_name}-${var.codepipeline_name}"
    codepipeline_role           = "${local.prefix_name}-${var.codepipeline_role}"
    inline_policy               = "${local.prefix_name}-${var.inline_policy}"
}
module "s3" {
    source                      = "./s3"
    bucket_name                 = "${local.prefix_name}-${var.bucket_name}"
    versioning_status           = var.versioning_status
    bucket_name_cicd            = "${local.prefix_name}-${var.bucket_name}-cicd"
    versioning_status_cicd      = var.versioning_status
}
module "monitoring" {
    source                      = "./monitoring"
    cloudwatch_log_group_name   = "${local.prefix_name}-${var.cloudwatch_log_group_name}"
    cloudwatch_log_stream_name  = "${local.prefix_name}-${var.cloudwatch_log_stream_name}"
}