resource "aws_route_table" "main" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }

    tags = {
        name = var.public_RT
    }
}

resource "aws_route_table_association" "az-2a" {
    subnet_id = aws_subnet.az_pub_2a.id
    route_table_id = aws_route_table.main.id

}

resource "aws_route_table_association" "az-2b" {
    subnet_id = aws_subnet.az_pub_2b.id
    route_table_id = aws_route_table.main.id
}

resource "aws_route_table" "az-pri-2b" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.az_pub_2b.id
    }

    tags = {
        name = var.nat_2b
    }
}

resource "aws_route_table_association" "az-pri-2a" {
    subnet_id = aws_subnet.az_pri_2a.id
    route_table_id = aws_route_table.az-pri-2a.id
}

resource "aws_route_table" "az-pri-2a" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.az_pub_2a.id
    }

    tags = {
        name = var.nat_2a
    }
}

resource "aws_route_table_association" "az-pri-2b" {
    subnet_id = aws_subnet.az_pri_2b.id
    route_table_id = aws_route_table.az-pri-2b.id
}