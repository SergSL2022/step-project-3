# data "aws_ami" "ubuntu_24_04_latest" {
#   most_recent      = true
#   owners           = ["099720109477"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# resource "aws_instance" "observer" {
#   ami           = data.aws_ami.ubuntu_24_04_latest.id
#   instance_type = "t3.micro"
#   root_block_device {
#     volume_size = 10
#   }
#   subnet_id = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [module.vpc.default_security_group_id]
#   key_name = "slipchuk-aws-ec2"

#   tags = {
#     Name  = "slipchuk-observer-VM"
#     Owner = "slipchuk"
#     CreatedBy = "Serhiy Slipchuk"
#     Purpose = "step-3"
#   }
# }

# resource "aws_instance" "target" {
#     count = var.instance_count

#   ami           = data.aws_ami.ubuntu_24_04_latest.id
#   instance_type = "t3.micro"
#   root_block_device {
#     volume_size = 10
#   }
#   subnet_id = module.vpc.public_subnets[1]
#   vpc_security_group_ids = [module.vpc.default_security_group_id]
#   key_name = "slipchuk-aws-ec2"

#   tags = {
#     Name  = "slipchuk-target-VM${count.index + 1}"
#     Owner = "slipchuk"
#     CreatedBy = "Serhiy Slipchuk"
#     Purpose = "step-3"
#   }
# }