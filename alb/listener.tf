resource "aws_lb_listener" "main" {
    load_balancer_arn = aws_alb.main.arn
    port = var.port
    protocol = var.protocol

    default_action {
        type = var.listener_action
        target_group_arn = aws_lb_target_group.main.arn
    }
}