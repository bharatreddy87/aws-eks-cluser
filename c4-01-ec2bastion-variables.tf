variable "ingress_cidr_blocks" {
  description = "ingress_cidr_blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_keypair" {
  description = "instance_keypair"
  type        = string
  default     = "eks-terraform-key"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t3.medium"
}
