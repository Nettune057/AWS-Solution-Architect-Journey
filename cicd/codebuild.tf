resource "aws_codebuild_project" "main" {
    name                          = var.codebuild_name
    build_timeout                 = var.build_timeout
    queued_timeout                = var.queued_timeout
    
    depends_on                    = [ aws_iam_role.example]
    service_role                  = aws_iam_role.example.arn


    source {
        type                      = "CODECOMMIT"
        buildspec                 = "buildspec.yml"
        location                  = aws_codecommit_repository.main.id
    }

    artifacts {
        type                      = "S3"
        location                  = var.bucket_location
    }

    logs_config {
        cloudwatch_logs {
            group_name            = var.cloudwatch_log_group_name
            stream_name           = var.cloudwatch_log_stream_name
        }
    }

    environment {
        privileged_mode           = true
        type                      = "LINUX_CONTAINER"
        compute_type              = "BUILD_GENERAL1_SMALL"
        image                     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    }
}