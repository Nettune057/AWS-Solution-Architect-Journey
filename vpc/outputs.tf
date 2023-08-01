output "vpcid" {
    value = aws_vpc.main.id
}

output "az_pub_2a" {
    value = aws_subnet.az_pub_2a.id
}

output "az_pub_2b" {
    value = aws_subnet.az_pub_2b.id
}

output "az_pri_2a" {
    value = aws_subnet.az_pri_2a.id
}

output "az_pri_2b" {
    value = aws_subnet.az_pri_2b.id
}

output "sec_group_id" {
    value = aws_security_group.for_alb_allow_all.id
}