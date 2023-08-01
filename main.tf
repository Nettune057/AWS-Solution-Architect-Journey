module "vpc" {
    source                      = "./vpc"
    cidr_blocks                 = "10.0.0.0/16"
    vpc_name                    = "tungnt_VPC_terraform"
    az_2a                       = "us-east-2a"
    az_2b                       = "us-east-2b"
    aws_subnet_pub_2a           = "public-sub-2a"
    aws_subnet_pub_2b           = "public-sub-2b"
    nat_2a                      = "nat_gw_2a"
    nat_2b                      = "nat_gw_2b"
    public_RT                   = "public_RT"
    private_2a                  = "private-sub-2a"
    private_2b                  = "private-sub-2b"
    IGW                         = "tungnt-IGW"
    cidr_block_pub2a            = "10.0.0.0/24"
    cidr_block_pub2b            = "10.0.1.0/24"
    cidr_block_pri2a            = "10.0.2.0/24"
    cidr_block_pri2b            = "10.0.3.0/24"
    security_groups_name        = "AllowAll"
}



module "alb" {
    source                      = "./alb"
    alb_name                    = "tungnt-alb-terraform"
    alb_type                    = "application"
    subnets                     = [module.vpc.az_pub_2a,module.vpc.az_pub_2b]
    tarname                     = "tungnt"
    another_port                = "3000"
    protocol                    = "HTTP"
    vpc_id                       = module.vpc.vpcid
    tartype                     = "ip"
    security_groups             = [module.vpc.sec_group_id]
}

module "ecs" {
    source                      = "./ecs"
    name                        = "tungnt-ecs"
    service_role                = "taskExcutionRoles-Tungnt"
    alb_name                    = module.alb.alb_name
    alb_association             = module.alb.target_group_arn
    subnets                     = [module.vpc.az_pri_2a,module.vpc.az_pri_2b]
    policy_name                 = "task_execution_terraform"
    ecs_role_name               = "ecs_role_name_terraform"
    vpcid                       = module.vpc.vpcid
    family                      = "service"
    network_mode                = "awsvpc"
    cpu                         = 512
    memory                      = 1024
    operating_system_family     = "LINUX"
    cpu_architecture            = "X86_64"
    ephemeral_storage           = 21
    service_name                = "tungnt"
    desired_count               = 2
    container_name              = "task"
    container_port              = "3000"
    security_groups             = [module.vpc.sec_group_id]
}
