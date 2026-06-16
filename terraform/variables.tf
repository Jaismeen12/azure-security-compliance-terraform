variable "location" {
  description = "Azure Region "
  type        = string
  default     = "Canada Central"
}

variable "policy_assignment_name" {
  description = "Policy Assignment Name"
  type        = string
  default     = "security-compliance-assignment"
}

variable "required_tag_name" {
  description = "Tag that must exist on resources"
  type        = string
  default     = "Owner"
}

