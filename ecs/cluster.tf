resource "aws_ecs_cluster" "name" {
    name                            = var.ecs_cluster_name
}

resource "aws_ecs_capacity_provider" "name" {
    name                            = var.capacity_provider_name
    auto_scaling_group_provider {
        auto_scaling_group_arn      = aws_autoscaling_group.main.arn
        managed_scaling {
            target_capacity = 100
        }
    }
}

resource "aws_launch_configuration" "ecs_launch_config" {
    image_id                        = var.image_id
    iam_instance_profile            = aws_iam_instance_profile.ecs_agent.name
    security_groups                 = var.security_groups
    user_data                       = var.user_data
    instance_type                   = var.instance_type
}

resource "aws_autoscaling_group" "main" {
    name                            = var.asg_name
    vpc_zone_identifier             = var.vpc_zone
    launch_configuration            = aws_launch_configuration.ecs_launch_config.name

    desired_capacity                = var.desired_capacity
    min_size                        = var.min_size
    max_size                        = var.max_size
    health_check_grace_period       = var.health_check_grace_period
    health_check_type               = var.health_check_type
}
