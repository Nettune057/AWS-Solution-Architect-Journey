resource "aws_security_group" "for_alb_allow_all" {
    name                        = var.security_groups_name
    vpc_id                      = aws_vpc.main.id

    ingress {
        from_port               = 0
        to_port                 = 0
        protocol                = "-1"
        cidr_blocks             = ["0.0.0.0/0"]
        }
        egress {
        from_port               = 0
        to_port                 = 0
        protocol                = "-1"
        cidr_blocks             = ["0.0.0.0/0"]
    }
}