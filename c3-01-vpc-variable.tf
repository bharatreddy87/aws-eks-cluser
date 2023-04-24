variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "eks-cluster-vpc"
}

variable "aws_cidr_block" {
  description = "aws_cidr_block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "public_subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "private_subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  description = "database_subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "enable_nat_gateway" {
  description = "enable_nat_gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "single_nat_gateway"
  type        = bool
  default     = false
}

variable "create_database_subnet_group" {
  description = "create_database_subnet_group"
  type        = bool
  default     = true
}

variable "create_database_subnet_route_table" {
  description = "create_database_subnet_route_table"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "enable_dns_support"
  type        = bool
  default     = true
}
