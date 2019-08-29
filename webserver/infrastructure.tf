module "infrastructure" {
  source              = "../modules/infrastructure"
  vpc_cidr            = "${var.vpc_cidr}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  region              = "${var.region}"
  availability_zone   = "${var.availability_zone}"
}