resource "aws_alb" "main" {
    name                                = var.alb_name
    internal                            = false
    load_balancer_type                  = var.alb_type
    security_groups                     = var.security_groups
    subnets                             = var.subnets
    enable_cross_zone_load_balancing    = true
}

