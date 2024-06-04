variable "aws_region" {
    description = "AWS region"
    type = string
    default = "eu-north-1"
}

variable "az_list" {
    description = "Availabitity Zones list"
    type = list(string)
    default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "vpc_cidr" {
    description = "VPC CIDR block"
    type = string
    default = "172.16.0.0/16"
}

variable "private_subnets_cidrs" {
    description = "Private subnets CIRDs"
    type = list(string)
    default = []
}

variable "public_subnets_cidrs" {
    description = "Public subnets CIRDs"
    type = list(string)
    default = ["172.16.1.0/24", "172.16.2.0/24"]
}

variable "open_ports" {
    description = "List of open ports"
    type = list(number)
    default = [22, 80, 443, 3000, 9090, 9093, 9100, 9101]
}

variable "owner" {
    description = "TAG: Owner"
    type = string
    default = "slipchuk"
}

variable "created_by" {
    description = "TAG: Created by"
    type = string
    default = "Serhiy Slipchuk"  
}

variable "purpose" {
    description = "TAG: Purpose"
    type = string
    default = "step-3"
}

variable "target_instance_count" {
  description = "Number of target EC2 instances"
  type        = number
  default     = 2
}