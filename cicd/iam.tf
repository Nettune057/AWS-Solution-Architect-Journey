resource "aws_iam_policy" "codeBuildBasePolicy" {
    name                                = var.codeBuildBasePolicy
    path                                = var.path
    policy                              = templatefile(
        "${path.module}/template/codeBuildBasePolicy.json",
            {
                LOG_GROUP               = var.log_group
                CODECOMMIT_ARN          = aws_codecommit_repository.main.arn
                S3_CICD_ARN             = var.s3_cicd_arn
            }
    )
}

resource "aws_iam_policy" "codeBuildBatchPolicy" {
    name                                = var.codeBuildBatchPolicy
    path                                = var.path
    policy                              = templatefile(
        "${path.module}/template/codeBuildBatchPolicy.json",
        {
            CODEBUILD_PROJ_ARN          = aws_codebuild_project.main.arn
        }
    )
}

resource "aws_iam_policy" "codeBuildServiceRolePolicy" {
    name                                = var.codeBuildServiceRolePolicy
    path                                = var.path
    policy                              = templatefile(
        "${path.module}/template/codeBuildServiceRolePolicy.json",
        {}
    )
}


resource "aws_iam_role" "example" {
    name                        = var.codebuild_role
    assume_role_policy          = data.aws_iam_policy_document.assume_role.json
    managed_policy_arns         = [
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser",
        aws_iam_policy.codeBuildBasePolicy.arn,
        aws_iam_policy.codeBuildServiceRolePolicy.arn,
    ]
}
resource "aws_iam_role" "codepipeline" {
    name        = var.codepipeline_role

    assume_role_policy = jsonencode(
    {
        "Version" : "2012-10-17",
        "Statement" : [
        {
            "Effect" : "Allow",
            "Principal" : {
            "Service" : "codepipeline.amazonaws.com"
            },
            "Action" : "sts:AssumeRole"
        }
        ]
    }
    )
    inline_policy {
    name = var.inline_policy
    policy = data.aws_iam_policy_document.codepipeline.json
    }
}

