variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain" {
  description = "Project domain"
  type        = string
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR"
  type        = string
}

variable "eks_name" {
  description = "AWS EKS Cluster Name"
  type        = string
}

variable "eks_system_node_instance_type" {
  description = "Kubernetes system node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_min_system_nodes" {
  description = "Minimum number of Kubernetes system nodes"
  type        = number
  default     = 1
}

variable "eks_max_system_nodes" {
  description = "Maximum number of Kubernetes system nodes"
  type        = number
  default     = 1
}

variable "eks_ops_node_instance_type" {
  description = "Kubernetes ops node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_min_ops_nodes" {
  description = "Minimum number of Kubernetes ops nodes"
  type        = number
  default     = 1
}

variable "eks_max_ops_nodes" {
  description = "Maximum number of Kubernetes ops nodes"
  type        = number
  default     = 1
}

variable "eks_app_node_instance_type" {
  description = "Kubernetes app node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_min_app_nodes" {
  description = "Minimum number of Kubernetes app nodes"
  type        = number
  default     = 1
}

variable "eks_max_app_nodes" {
  description = "Maximum number of Kubernetes app nodes"
  type        = number
  default     = 1
}

variable "alb_name" {
  type        = string
  description = "Name of EKS's alb"
}

variable "access_logs_bucket_name" {
  type        = string
  description = "Access logs bucket name. It is creating during the provisioning."
}

variable "eks_node_port" {
  type        = string
  default     = ""
  description = "EKS Cluster node port."
}
