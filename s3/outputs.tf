output "s3_arn" {
    value = aws_s3_bucket.cicd.arn
}

output "s3_name" {
    value = aws_s3_bucket.cicd.bucket
}