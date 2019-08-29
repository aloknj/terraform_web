/* Security group for the web */
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for web that allows web traffic from internet"
  vpc_id      = "${module.infrastructure.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/* Web servers */
resource "aws_instance" "web" {
  ami               = "${lookup(var.amis, var.region)}"
  instance_type     = "${var.instance_type}"
  subnet_id         = "${module.infrastructure.public_subnet_id}"
  vpc_security_group_ids = [
    "${aws_security_group.web_server_sg.id}"
  ]
  associate_public_ip_address = true
  key_name          = "${var.key_name}"
  user_data         = "${file("files/user_data.sh")}"

}

