output "repository_arn" {
    value = aws_codecommit_repository.main.arn
}

output "repository_id" {
    value = aws_codecommit_repository.main.repository_id
}

output "clone_url_http" {
    value = aws_codecommit_repository.main.clone_url_http
}

output "clone_url_ssh" {
    value = aws_codecommit_repository.main.clone_url_ssh
}