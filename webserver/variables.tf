########################################
# Variables
########################################
variable "region" {
  description = "The AWS region to be used"
  type        = "string"
}

variable "aws_access_key" {
    description = "AWS user access key who has the permission to create EC2 resources"
    type        = "string"
}

variable "aws_secret_key" {
    description = "AWS user secret key who has the permission to create EC2 resources"
    type        = "string"
}

variable "key_name" {
    description = "AWS key pair name"
    type = "string"
}

variable "availability_zone" {
  description = "The AZ that the resources will be launched"
}

# Networking
variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block of the public subnet"
}

variable "amis" {
  default = {
    "eu-west-2" = "ami-0cbe2951c7cd54704"
  }
}

variable "instance_type" {
  description = "The instance type to launch"
}


