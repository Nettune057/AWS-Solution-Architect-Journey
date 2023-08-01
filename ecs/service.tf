resource "aws_ecs_service" "main" {
    name                   = var.service_name
    cluster                = aws_ecs_cluster.main.id
    launch_type            = "FARGATE"
    platform_version       = "LATEST"
    task_definition        = aws_ecs_task_definition.main.arn
    desired_count          = var.desired_count
    depends_on             = [aws_iam_policy.name]
    load_balancer {
        target_group_arn   = var.alb_association
        container_name     = var.container_name
        container_port     = var.container_port
        
    }
    network_configuration {
        security_groups    = var.security_groups
        subnets            = var.subnets
        assign_public_ip   = false
    }
}