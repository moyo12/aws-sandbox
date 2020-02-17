variable "vpc_id" {}
variable "private_subnet" {}
variable "public_subnet" {}

resource "aws_subnet" "public" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.public_subnet}"

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.private_subnet}"

  tags = {
    Name = "PrivateSubnet"
  }
}