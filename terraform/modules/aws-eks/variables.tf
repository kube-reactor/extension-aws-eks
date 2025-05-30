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

variable "kube_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.32"
}

variable "system_node_instance_type" {
  description = "Kubernetes system node AWS instance type"
  type        = string
  default     = "t3.xlarge"
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

variable "data_node_instance_type" {
  description = "Kubernetes data node AWS instance type"
  type        = string
  default     = "t3.xlarge"
}

variable "min_data_nodes" {
  description = "Minimum number of Kubernetes data nodes"
  type        = number
  default     = 1
}

variable "max_data_nodes" {
  description = "Maximum number of Kubernetes data nodes"
  type        = number
  default     = 1
}

variable "data_node_volume_mount_path" {
  description = "Kubernetes data node volume mount path"
  type        = string
  default     = "/var/lib/longhorn"
}

variable "data_node_volume_type" {
  description = "Kubernetes data node volume type"
  type        = string
  default     = "gp3"
}

variable "data_node_volume_size" {
  description = "Kubernetes data node volume size in GB"
  type        = number
  default     = 100
}

variable "data_node_volume_iops" {
  description = "Kubernetes data node volume IOPS"
  type        = number
  default     = 3000
}

variable "data_node_volume_throughput" {
  description = "Kubernetes data node volume throughput"
  type        = number
  default     = 125
}

variable "data_node_volume_encrypted" {
  description = "Kubernetes data node volume encryption enabled"
  type        = bool
  default     = true
}

variable "ops_node_instance_type" {
  description = "Kubernetes ops node AWS instance type"
  type        = string
  default     = "t3.xlarge"
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
  default     = "t3.xlarge"
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
