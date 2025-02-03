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
