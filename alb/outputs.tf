output "target_group_arn" {
    value = aws_lb_target_group.main.arn
}

output "alb_name" {
    value = aws_alb.main.id
}
