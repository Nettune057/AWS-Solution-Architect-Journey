resource "aws_cloudwatch_log_group" "name" {
    name = var.cloudwatch_log_group_name
}

resource "aws_cloudwatch_log_stream" "name" {
    name = var.cloudwatch_log_stream_name
    log_group_name = aws_cloudwatch_log_group.name.name
}