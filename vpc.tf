module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.owner}-vpc"
  cidr = var.vpc_cidr

  azs                     = var.az_list
  private_subnets         = var.private_subnets_cidrs
  public_subnets          = var.public_subnets_cidrs
  map_public_ip_on_launch = true

  default_security_group_ingress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = "0.0.0.0/0"
      description      = "Open HTTP port"
      self             = false
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = "0.0.0.0/0"
      description      = "Open SSH port"
      self             = false
    }
  ]

  default_security_group_egress = [{
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = "0.0.0.0/0"
    description      = "Allow all outbound traffic"
    self             = false
  }]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Owner     = var.owner
    CreatedBy = var.created_by
    Purpose   = var.purpose
  }
}
