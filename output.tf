output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.default_vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "public_route_table_ids" {
  description = "Public route table IDs"
  value       = module.vpc.public_route_table_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "private_route_table_ids" {
  description = "Private route table IDs"
  value       = module.vpc.private_route_table_ids
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value = module.vpc.igw_id
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value = module.vpc.natgw_ids
}

output "nat_eip_public_ip" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value = module.vpc.nat_public_ips
}

output "default_security_group_id" {
  description = "Deafault security group ID"
  value = module.vpc.default_security_group_id
}

output "EC2_observer_public_ip" {
    description = "Observer public IP address"
    value = aws_instance.observer.public_ip
}

output "EC2_target_public_ips" {
    description = "Targets public IP addresses"
    value = aws_instance.target[*].public_ip
}