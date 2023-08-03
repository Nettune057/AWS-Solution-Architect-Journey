resource "aws_subnet" "az_pub_2a" {
    vpc_id = aws_vpc.main.id
    availability_zone = var.az_2a
    cidr_block = var.cidr_block_pub2a

    tags = {
        Name = var.aws_subnet_pub_2a
    }
}

resource "aws_subnet" "az_pub_2b" {
    vpc_id = aws_vpc.main.id
    availability_zone = var.az_2b
    cidr_block = var.cidr_block_pub2b

    tags = {
        Name = var.aws_subnet_pub_2b
    }
}

resource "aws_subnet" "az_pri_2a" {
    vpc_id = aws_vpc.main.id
    availability_zone = var.az_2a
    cidr_block = var.cidr_block_pri2a

    tags = {
        Name = var.private_2a
    }
}

resource "aws_subnet" "az_pri_2b" {
    vpc_id = aws_vpc.main.id
    availability_zone = var.az_2b
    cidr_block = var.cidr_block_pri2b
    tags = {
        Name = var.private_2b
    }
}