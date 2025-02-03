output "vpc_id" {
  description = "AWS VPC ID"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "AWS VPC Private Subnets"
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "AWS VPC Public Subnets"
  value       = module.vpc.public_subnets
}

output "repository_urls" {
  description = "The URL of the repositories (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
  value       = module.ecr.repository_urls
}
