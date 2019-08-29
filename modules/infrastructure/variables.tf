variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "region" {
  description = "The region to launch the webserver"
}

variable "availability_zone" {
  description = "The AZ that the resources will be launched"
}