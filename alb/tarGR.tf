resource "aws_lb_target_group" "main" {
    name = var.tarname
    port = var.another_port
    protocol = var.protocol
    vpc_id   = var.vpc_id
    target_type = var.tartype

    health_check {
        enabled = true
        healthy_threshold = var.healthy_threshold
        interval = var.interval
        matcher = var.matcher
        path = var.path
        port = var.another_port
        protocol = var.protocol
    }
}