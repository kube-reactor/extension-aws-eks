terraform {
  required_version = "~> 1.3"

  backend "s3" {
    key     = "applications/terraform.tfstate"
    encrypt = true
  }
}
