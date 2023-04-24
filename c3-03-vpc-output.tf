output "vpc_id" {
  description = "vpc_id"
  value       = module.vpc.vpc_id
}

output "azs" {
  description = "azs"
  value       = module.vpc.azs
}

output "private_subnet_arns" {
  description = "private_subnet_arns"
  value       = module.vpc.private_subnet_arns
}

output "vpc_cidr_block" {
  description = "vpc_cidr_block"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "public_subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "private_subnets"
  value       = module.vpc.private_subnets
}

output "nat_public_ips" {
  description = "nat_public_ips"
  value       = module.vpc.nat_public_ips
}

output "igw_arn" {
  description = "igw_arn"
  value       = module.vpc.igw_arn
}

output "database_route_table_ids" {
  description = "database_route_table_ids"
  value       = module.vpc.database_route_table_ids
}
