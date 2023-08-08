data "aws_iam_policy_document" "assume_role" {
    statement {
        effect = "Allow"

        principals {
            type        = "Service"
            identifiers = ["codebuild.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

data "aws_iam_policy_document" "assume_role_1" {

    statement{
        effect = "Allow"
        principals {
            type        = "Service"
            identifiers = ["codepipeline.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

data "aws_iam_policy_document" "codepipeline" {
    statement {
    sid = "SSOCodePipelineAllow"

    actions = [
        "s3:*",
    ]

    resources = [
        "*",
    ]
    }

    statement {
    actions = [
        "iam:PassRole",
    ]

    resources = [
        aws_iam_role.example.arn,
    ]
    }

    statement {
    actions = [
        "codecommit:BatchGet*",
        "codecommit:BatchDescribe*",
        "codecommit:Describe*",
        "codecommit:Get*",
        "codecommit:List*",
        "codecommit:GitPull",
        "codecommit:UploadArchive",
        "codecommit:GetBranch",
    ]

    resources = [
        "*",
    ]
    }

    statement {
        actions = [
        "codebuild:StartBuild",
        "codebuild:StopBuild",
        "codebuild:BatchGetBuilds",
    ]

    resources = [
        aws_codebuild_project.main.arn,
    ]
    }
}