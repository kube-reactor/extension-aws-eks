module "remote_state" {
  source                  = "nozaq/remote-state-s3-backend/aws"
  override_s3_bucket_name = true
  s3_bucket_name          = var.bucket_name
  s3_bucket_name_replica  = "${var.bucket_name}-replica"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}

resource "aws_iam_user" "terraform" {
  name = "TerraformUser"
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}
