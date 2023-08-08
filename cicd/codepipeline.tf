resource "aws_codepipeline" "name" {
    name                            = var.codepipeline_name
    role_arn                        = aws_iam_role.codepipeline.arn

    depends_on                      = [ aws_iam_role.codepipeline ]
    artifact_store {
        location                    = var.bucket_location
        type                        = "S3"
    }

    stage {
        name                        = var.source_pipeline
        action {
            name                    = var.source_pipeline
            category                = var.source_pipeline
            owner                   = var.owner
            provider                = var.provider_codecommit
            version                 = "1"
            output_artifacts        = ["source_output"]
            configuration = {
                BranchName          = "master"
                RepositoryName      = aws_codecommit_repository.main.repository_name
                PollForSourceChanges= true
            }
        }
    }

    stage {
        name                        = var.build
        action {
            run_order               = 1
            name                    = var.build
            category                = var.build
            owner                   = var.owner
            provider                = var.provider_codebuild
            input_artifacts         = ["source_output"]
            output_artifacts        = ["TerraformBuildFile"]
            version                 = "1"

            configuration = {
                ProjectName         = aws_codebuild_project.main.name
            }
        }
    }

    stage {
        name = "Manual-Approval"

        action {
        run_order = 1
        name                        = "AWS-Admin-Approval"
        category                    = "Approval"
        owner                       = "AWS"
        provider                    = "Manual"
        version                     = "1"
        input_artifacts             = []
        output_artifacts            = []

        configuration = {
            CustomData              = "Please verify"
        }
        }
    }

    stage {
    name = "Deploy"

    action {
        run_order        = 1
        name             = "Terraform-Apply"
        category         = var.build
        owner            = var.owner
        provider         = var.provider_codebuild
        input_artifacts  = ["source_output", "TerraformBuildFile"]
        output_artifacts = []
        version          = "1"

        configuration = {
            ProjectName          = aws_codebuild_project.main.name
            PrimarySource        = "source_output"
        }
        }
    }
}