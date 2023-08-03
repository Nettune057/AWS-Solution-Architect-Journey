output "vpc_id" {
    value = module.vpc.vpc_id
}

output "alb_dns" {
    value = module.alb.alb_dns
}