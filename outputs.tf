output "vpc_id" {
    value = module.vpc.vpc_id
}

output "alb_dns" {
    value = module.alb.alb_dns
}

output "repository_url" {
    value = module.ecr.ecr_repository_url
}

output "codecommit_url" {
    value = module.cicd.clone_url_http
}