provider "aws" {
  region = var.region
}

module "argocd-apps" {
  source = "../argocd-apps/gateway"

  domain      = var.domain
  environment = var.environment

  project_path = var.project_path

  kube_config             = var.kube_config
  argocd_admin_password   = var.argocd_admin_password
  argocd_project_sequence = var.argocd_project_sequence

  variables = var.variables
}
