variable "instance_count" {
  description = "The number of instances"
  type        = string
  default     = "1"
}

variable "region" {
  description = "The civo region to create instance in"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The civo instance type"
  type        = string
  default     = "g4s.xsmall"
}

variable "disk_image_name" {
  description = "The civo disk image name"
  type        = string
  default     = "ubuntu-jammy"
}

variable "disk_image_version" {
  description = "The civo disk image version"
  type        = string
  default     = "22.04"
}

variable "civo_token" {
  description = "The civo token to use Civo provider"
  type        = string
  default     = ""
}
