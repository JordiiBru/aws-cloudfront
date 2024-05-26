# REQUIRED VARIABLES

variable "stage" {
  description = "Stage of development"
  type        = string

  validation {
    condition     = can(regex("^(test|dev|stagin|prod)$", var.stage))
    error_message = "Stage must be dev, staging or prod."
  }
}

variable "purpose" {
  description = "Short description about the created resource"
  type        = string
  default     = null

  validation {
    condition     = can(regex("^([a-zA-Z0-9-_]*)$", var.purpose))
    error_message = "Only the expression [a-zA-Z0-9-_]* is allowed."
  }
}

variable "owner" {
  description = "Owner of the deployed infrastructure"
  type        = string
  default     = null

  validation {
    condition     = length(var.owner) >= 3
    error_message = "You must define an owner with more than three letters."
  }
}

# CUSTOM VARIABLES
variable "bucket_origin_id" {
  description = "Bucket origin id"
  type        = string
  default     = ""
}

variable "regional_domain" {
  description = "Bucket domain name"
  type        = string
  default     = ""
}

variable "cert_id" {
  description = "SSL Certificate arn to attach on the cloudfront distribution"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Name of the domain"
  type        = string
  default     = ""
  validation {
    condition     = length(var.domain_name) >= 3
    error_message = "You must define a domain name."
  }
}