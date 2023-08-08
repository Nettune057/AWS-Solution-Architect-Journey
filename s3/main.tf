resource "aws_s3_bucket" "main" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "main" {
    bucket = aws_s3_bucket.main.id
    versioning_configuration {
        status = var.versioning_status
    }
}

resource "aws_s3_bucket" "cicd" {
    bucket = var.bucket_name_cicd
}

resource "aws_s3_bucket_versioning" "cicd" {
    bucket = aws_s3_bucket.cicd.id
    versioning_configuration {
        status = var.versioning_status_cicd
    }
}

resource "aws_s3_bucket_policy" "cicd" {
    bucket = aws_s3_bucket.cicd.id
    policy = templatefile(
        "${path.module}/template/iam_bucket_cicd.json",
        {
            S3_CICD_ARN         = aws_s3_bucket.cicd.arn
        }
    )
}
