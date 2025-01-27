variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain" {
  description = "Platform domain"
  type        = string
}
variable "environment" {
  description = "Platform environment"
  type        = string
  default     = "local"
}

variable "project_path" {
  description = "Base project path"
  type        = string
}
variable "kube_config" {
  description = "Kubernetes cluster credential file"
  type        = string
}

variable "argocd_admin_password" {
  description = "ArgoCD administrator password (bcrypt hash)"
  type        = string
}
variable "argocd_project_sequence" {
  description = "ArgoCD provisioner project sequence"
  type        = list(string)
  default = [
    "system",
    "platform",
    "database",
    "management"
  ]
}

variable "variables" {
  description = "Map of environment variables for interpolation into application configurations"
  type        = map(string)
}
