output "cloudwatch_log_stream_name" {
    value = aws_cloudwatch_log_group.name.name
}

output "cloudwatch_log_group_name" {
    value = aws_cloudwatch_log_group.name.name
}

output "cloudwatch_log_group_arn" {
    value = aws_cloudwatch_log_group.name.arn
}