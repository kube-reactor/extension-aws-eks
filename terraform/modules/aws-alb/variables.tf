variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR"
  type        = string
}

variable "domain" {
  description = "AWS ALB and certificate domain"
  type        = string
}

variable "name" {
  description = "AWS ALB name"
  type        = string
}

variable "bucket_name" {
  description = "AWS ALB logging bucket name"
  type        = string
}


variable "enable_bucket_versioning" {
  description = "AWS ALB enable logging bucket versioning"
  type        = bool
  default     = false
}

variable "node_port" {
  description = "AWS EKS node port"
  type        = number
}

variable "enable_bucket_versioing" {
  type    = bool
  default = true
}
