variable "resource_group_location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resource group."
}

variable "username" {
  type        = string
  default     = "lucas"
  description = "VM principal username."
}

variable "ssh_pub_key" {
  type  = string
}