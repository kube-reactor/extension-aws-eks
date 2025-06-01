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

variable "eks_version" {
  description = "EKS Cluster Kubernetes Version"
  type        = string
  default     = "1.32"
}

variable "eks_node_volume_mount_path" {
  description = "Kubernetes node volume mount path"
  type        = string
  default     = "/var/lib/longhorn"
}

variable "eks_system_node_instance_type" {
  description = "Kubernetes system node AWS instance type"
  type        = string
  default     = "t3.xlarge"
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

variable "eks_data_node_instance_type" {
  description = "Kubernetes data node AWS instance type"
  type        = string
  default     = "t3.xlarge"
}

variable "eks_data_nodes" {
  description = "Number of Kubernetes data nodes"
  type        = number
  default     = 1
}

variable "eks_data_node_volume_type" {
  description = "Kubernetes data node volume type"
  type        = string
  default     = "gp3"
}

variable "eks_data_node_volume_size" {
  description = "Kubernetes data node volume size in GB"
  type        = number
  default     = 100
}

variable "eks_data_node_volume_iops" {
  description = "Kubernetes data node volume IOPS"
  type        = number
  default     = 3000
}

variable "eks_data_node_volume_throughput" {
  description = "Kubernetes data node volume throughput"
  type        = number
  default     = 125
}

variable "eks_data_node_volume_encrypted" {
  description = "Kubernetes data node volume encryption enabled"
  type        = bool
  default     = true
}

variable "eks_storage_node_instance_type" {
  description = "Kubernetes storage node AWS instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_storage_nodes" {
  description = "Number of Kubernetes storage nodes"
  type        = number
  default     = 1
}

variable "eks_storage_node_volume_type" {
  description = "Kubernetes storage node volume type"
  type        = string
  default     = "gp3"
}

variable "eks_storage_node_volume_size" {
  description = "Kubernetes storage node volume size in GB"
  type        = number
  default     = 100
}

variable "eks_storage_node_volume_iops" {
  description = "Kubernetes storage node volume IOPS"
  type        = number
  default     = 3000
}

variable "eks_storage_node_volume_throughput" {
  description = "Kubernetes storage node volume throughput"
  type        = number
  default     = 125
}

variable "eks_storage_node_volume_encrypted" {
  description = "Kubernetes storage node volume encryption enabled"
  type        = bool
  default     = true
}

variable "eks_ops_node_instance_type" {
  description = "Kubernetes ops node AWS instance type"
  type        = string
  default     = "t3.xlarge"
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
  default     = "t3.xlarge"
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
