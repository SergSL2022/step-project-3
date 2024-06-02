resource "aws_security_group" "slipchuk-lb-sg" {
  name   = "${var.owner}-lb-sg"
  vpc_id = module.vpc.vpc_id

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
    Name      = "${var.owner}-alb"
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
  subnets            = module.vpc.public_subnets

  tags = {
    Name      = "${var.owner}-alb"
    Owner     = var.owner
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
  }
}

resource "aws_lb_target_group" "slipchuk-tg" {
  name        = "${var.owner}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"


  health_check {
    interval            = 30
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name      = "${var.owner}-alb"
    Owner     = var.owner
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
  }
}

resource "aws_lb_target_group_attachment" "slipchuk-tg-attachment" {
  target_group_arn = aws_lb_target_group.slipchuk-tg.arn
  target_id        = aws_instance.observer.id
  port             = 80
}


resource "aws_lb_listener" "slipchuk-listener" {
  load_balancer_arn = aws_lb.slipchuk-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.slipchuk-tg.arn
  }
}
