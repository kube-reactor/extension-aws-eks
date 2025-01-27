variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR"
  type        = string
}

variable "name" {
  description = "AWS EKS Cluster Name"
  type        = string
}

variable "system_node_instance_type" {
  description = "Kubernetes system node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "min_system_nodes" {
  description = "Minimum number of Kubernetes system nodes"
  type        = number
  default     = 1
}

variable "max_system_nodes" {
  description = "Maximum number of Kubernetes system nodes"
  type        = number
  default     = 1
}

variable "ops_node_instance_type" {
  description = "Kubernetes ops node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "min_ops_nodes" {
  description = "Minimum number of Kubernetes ops nodes"
  type        = number
  default     = 1
}

variable "max_ops_nodes" {
  description = "Maximum number of Kubernetes ops nodes"
  type        = number
  default     = 1
}

variable "app_node_instance_type" {
  description = "Kubernetes app node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "min_app_nodes" {
  description = "Minimum number of Kubernetes app nodes"
  type        = number
  default     = 1
}

variable "max_app_nodes" {
  description = "Maximum number of Kubernetes app nodes"
  type        = number
  default     = 1
}
