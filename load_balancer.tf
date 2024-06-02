resource "aws_security_group" "slipchuk-lb-sg" {
  name   = "${owner}-lb-sg"
  vpc_id = module.vpc.default_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${owner}-alb"
    Owner     = var.owner
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
  }
}

resource "aws_lb" "slipchuk-alb" {
  name               = "${var.owner}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.slipchuk-lb-sg.id]
  subnets            = module.vpc.public_subnet_ids

  tags = {
    Name      = "${owner}-alb"
    Owner     = var.owner
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
  }
}

