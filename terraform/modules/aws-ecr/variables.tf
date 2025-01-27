variable "name" {
  type        = string
  description = "Name of the repository."
}

variable "force_delete" {
  type        = bool
  default     = false
  description = " If true, will delete the repository even if it contains images. Defaults to false."
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "he tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
}

variable "scan_images_on_push" {
  type        = bool
  default     = false
  description = " Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
}

variable "principals_readonly_access" {
  type        = list(string)
  description = "Principal ARNs to provide with readonly access to the ECR"
  default     = []
}

variable "principals_push_access" {
  type        = list(string)
  description = "Principal ARNs to provide with push access to the ECR"
  default     = []
}