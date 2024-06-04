module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.owner}-vpc"
  cidr = var.vpc_cidr

  azs                     = var.az_list
  private_subnets         = var.private_subnets_cidrs
  public_subnets          = var.public_subnets_cidrs
  map_public_ip_on_launch = true

  default_security_group_ingress = [
    for port in var.open_ports : {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Open port ${port}"
      self        = false
    }
  ]

  default_security_group_egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow all outbound traffic"
    self        = false
  }]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Owner     = var.owner
    CreatedBy = var.created_by
    Purpose   = var.purpose
  }
}
