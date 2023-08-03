resource "aws_ecs_task_definition" "main" {
    family                          = var.family
    network_mode                    = var.network_mode
    cpu                             = var.cpu
    memory                          = var.memory
    requires_compatibilities        = var.requires_compatibilities
    execution_role_arn              = aws_iam_role.name.arn
    task_role_arn                   = aws_iam_role.name.arn
    
    runtime_platform {
        operating_system_family     = var.operating_system_family
        cpu_architecture            = var.cpu_architecture
    }
    container_definitions           = jsonencode([
        {
            name                    = "ECS-dev-container"
            image                   = "400516100932.dkr.ecr.us-east-2.amazonaws.com/aws-ecs-docker:latest"
            cpu                     = 256
            memory                  = 256

            essential               = true
            portMappings            = [
                {
                    containerPort   = 3000
                    hostPort        = 3000
                    protocol        = "tcp"
                }
            ]
            ulimits = [
                {
                    name            = "memlock"
                    softLimit       = 0
                    hardLimit       = 1
                }
            ]
        }
    ])

}