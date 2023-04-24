variable "eks_cluster_name" {
  description = "eks_cluster_name which we are going to use for cluster"
  type        = string
  default     = "eksdemo"
}

variable "cluster_version" {
  description = "cluster_version"
  type = string
  default = "1.22"  
}


variable "endpoint_public_access" {
  description = "endpoint_public_access"
  type = bool
  default = true  
}

variable "endpoint_private_access" {
  description = "endpoint_private_access"
  type = bool
  default = true
}

variable "public_access_cidrs" {
  description = "public_access_cidrs"
  type = list(string)
  default = [ "0.0.0.0/0" ]  
}

variable "service_ipv4_cidr" {
  description = "service_ipv4_cidr"
  type = string
  default = "172.20.0.0/16"
  
}