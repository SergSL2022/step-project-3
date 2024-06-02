data "aws_ami" "ubuntu_24_04_latest" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# =============================================== SSH KEYS =================================
resource "tls_private_key" "slipchuk_step3" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "slipchuk_step3_private_key" {
  content         = tls_private_key.slipchuk_step3.private_key_pem
  filename        = "${path.module}/slipchuk-step3"
  file_permission = "0600"
}

resource "local_file" "slipchuk_step3_public_key" {
  content  = tls_private_key.slipchuk_step3.public_key_openssh
  filename = "${path.module}/slipchuk-step3.pub"
  file_permission = "0600"
}


resource "aws_key_pair" "slipchuk_step3" {
  key_name   = "slipchuk-step3"
  public_key = tls_private_key.slipchuk_step3.public_key_openssh
}


# =========================================== EC2 instances =================================
resource "aws_instance" "observer" {
  ami           = data.aws_ami.ubuntu_24_04_latest.id
  instance_type = "t3.micro"
  root_block_device {
    volume_size = 10
  }
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  key_name               = aws_key_pair.slipchuk_step3.key_name
  user_data              = file("./scripts/terraform_provision.sh")

  tags = {
    Name      = "slipchuk-observer-VM"
    Owner     = "slipchuk"
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
    Role      = "observer"
  }
}

resource "aws_instance" "target" {
  count = var.target_instance_count

  ami           = data.aws_ami.ubuntu_24_04_latest.id
  instance_type = "t3.micro"
  root_block_device {
    volume_size = 10
  }
  subnet_id              = module.vpc.public_subnets[1]
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  key_name               = aws_key_pair.slipchuk_step3.key_name
  user_data              = file("./scripts/terraform_provision.sh")

  tags = {
    Name      = "slipchuk-target-VM${count.index + 1}"
    Owner     = "slipchuk"
    CreatedBy = "Serhiy Slipchuk"
    Purpose   = "step-3"
    Role      = "target"
  }
}
