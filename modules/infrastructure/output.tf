output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "webserver_sg_id" {
  value = "${aws_security_group.webserver.id}"
}