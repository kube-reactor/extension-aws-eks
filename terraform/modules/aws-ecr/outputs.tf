output "repository_urls" {
  value       = try(aws_ecr_repository.apps[*].repository_url, [])
  description = "The URL of the repositories (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}
