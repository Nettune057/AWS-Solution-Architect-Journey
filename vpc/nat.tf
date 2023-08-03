resource "aws_eip" "az_pub_2a" {
    domain                  = var.domain
}
resource "aws_nat_gateway" "az_pub_2a" {
    allocation_id           = aws_eip.az_pub_2a.id
    subnet_id               = aws_subnet.az_pub_2a.id
    tags = {
        Name                = var.nat_2a
    }
    depends_on              = [ aws_internet_gateway.main ]
}

resource "aws_eip" "az_pub_2b" {
    domain                  = var.domain
}
resource "aws_nat_gateway" "az_pub_2b" {
    allocation_id           = aws_eip.az_pub_2b.id
    subnet_id               = aws_subnet.az_pub_2b.id
    tags = {
        Name                = var.nat_2b
    }
    depends_on              = [ aws_internet_gateway.main ]
}