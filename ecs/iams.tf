data "aws_iam_policy_document" "name" {
    version                 = "2012-10-17"
    statement {
    
        effect              = "Allow"
        actions             = [
                                "ecr:GetAuthorizationToken",
                                "ecr:BatchCheckLayerAvailability",
                                "ecr:GetDownloadUrlForLayer",
                                "ecr:BatchGetImage",
                                "logs:CreateLogStream",
                                "logs:PutLogEvents",
                                "logs:CreateLogGroup",
                                "ecr:BatchCheckLayerAvailability",
                                "ecr:BatchGetImage",
                                "ecr:GetDownloadUrlForLayer"
        ]
    resources               = ["*"]
    }
}


resource "aws_iam_policy" "name" {
    name                    = var.policy_name
    path                    = var.path
    policy                  = data.aws_iam_policy_document.name.json

}

resource "aws_iam_role" "name" {
    name                    = var.ecs_role_name
    assume_role_policy      = jsonencode({
    Version                 = "2012-10-17"
    Statement               = [
        {
            Action          = "sts:AssumeRole"
            Effect          = "Allow"
            Sid             = ""
            Principal       = {
            Service         = "ecs-tasks.amazonaws.com"
        }
        },
    ]
    })
    managed_policy_arns = [aws_iam_policy.name.arn,"arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
}

data "aws_iam_policy_document" "ecs_agent" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "ecs_agent" {
    name               = var.instance_role_name
    assume_role_policy = data.aws_iam_policy_document.ecs_agent.json
    managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role","arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
}


resource "aws_iam_instance_profile" "ecs_agent" {
    name = var.instance_role_name
    role = aws_iam_role.ecs_agent.name
}