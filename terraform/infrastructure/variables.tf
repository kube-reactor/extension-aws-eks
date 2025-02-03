variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "AWS VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "AWS VPC Subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "AWS VPC Subnet CIDRs"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "repositories" {
  type = map(object({
    tags        = map(string)
    ro_accounts = list(string)
    rw_accounts = list(string)
  }))
  default = {}
}

variable "force_delete" {
  type        = bool
  default     = false
  description = "If true, will delete the repository even if it contains images. Defaults to false."
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
}

variable "scan_images_on_push" {
  type        = bool
  default     = false
  description = " Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
}
