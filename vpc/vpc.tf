resource "aws_vpc" "main" {
    cidr_block              = var.cidr_blocks

    tags                    = {
        Name                = var.vpc_name
    }
}