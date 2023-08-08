variable "repository_name" {}
variable "default_branch" {}

variable "codebuild_name" {}
variable "build_timeout" {}
variable "queued_timeout" {}
variable "bucket_location" {}
variable "cloudwatch_log_group_name" {}
variable "cloudwatch_log_stream_name" {}

variable "s3_cicd_arn" {}
variable "log_group" {}
variable "codeBuildBasePolicy" {}
variable "codeBuildServiceRolePolicy" {}
variable "codeBuildBatchPolicy" {}
variable "path" {
    default = "/"
}
variable "codebuild_role" {}
variable "codepipeline_role" {}
variable "inline_policy" {}
variable "codepipeline_name" {}
variable "source_pipeline" {
    default = "Source"
}
variable "build" {
    default = "Build"
}
variable "owner" {
    default = "AWS"
}
variable "provider_codecommit" {
    default = "CodeCommit"
}
variable "provider_codebuild" {
    default = "CodeBuild"
}