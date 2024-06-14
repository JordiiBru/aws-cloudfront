# COMMON VARIABLES

variable "stage" {
  description = "The stage of development (e.g., test, dev, staging, prod)."
  type        = string

  validation {
    condition     = can(regex("^(test|dev|staging|prod)$", var.stage))
    error_message = "Stage must be one of the following: test, dev, staging, prod."
  }
}

variable "purpose" {
  description = "A short description about the purpose of the created resource."
  type        = string
  default     = null

  validation {
    condition     = can(regex("^([a-zA-Z0-9-_]*)$", var.purpose))
    error_message = "Only the characters [a-zA-Z0-9-_] are allowed."
  }
}

variable "owner" {
  description = "The owner of the deployed infrastructure."
  type        = string
  default     = null

  validation {
    condition     = length(var.owner) >= 3
    error_message = "The owner name must be at least three characters long."
  }
}

# CUSTOM VARIABLES

variable "website_endpoint" {
  description = "S3 bucket website endpoint."
  type        = string
}

variable "regional_domain" {
  description = "The regional domain name of the hosting S3 bucket."
  type        = string
}

variable "cert_arn" {
  description = "The ARN of the SSL certificate to attach to the CloudFront distribution."
  type        = string
}

variable "subdomain" {
  description = "The name of the subdomain."
  type        = string

  validation {
    condition     = length(var.subdomain) >= 3
    error_message = "You must define a subdomain name with at least three characters."
  }
}
