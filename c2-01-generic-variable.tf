variable "aws_region" {
  description = "AWS region which we are going to work on"
  type        = string
  default     = "us-east-1"
}

variable "Environment" {
  description = "Environment which we are ging to use"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "business_division which we are belongs to"
  type        = string
  default     = "SAP"
}
