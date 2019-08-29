########################################
# Provider
########################################

terraform {
  required_version = ">= 0.11, < 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_key_pair" "key" {
  key_name   = "${var.key_name}"
  public_key = "${file("files/webserver_key.pub")}"
}

