data "aws_iam_policy_document" "name" {
    version = "2012-10-17"
    statement {
    
        effect = "Allow"
        actions = [
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
    resources = ["*"]
    }
}


resource "aws_iam_policy" "name" {
    name                 = var.policy_name
    path                 = "/"
    policy               = data.aws_iam_policy_document.name.json

}

resource "aws_iam_role" "name" {
    name = var.ecs_role_name
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
            Service = "ecs-tasks.amazonaws.com"
        }
        },
    ]
    })
    managed_policy_arns = [aws_iam_policy.name.arn,"arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
}