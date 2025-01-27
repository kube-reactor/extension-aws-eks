
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "ecr" {
  source = "../modules/aws-ecr"

  name = var.repository_name

  principals_readonly_access = var.principals_readonly_access
  principals_push_access     = var.principals_push_access
}
