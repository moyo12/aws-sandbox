variable "vpc_cidr" {}
variable "vpc_name" {}

resource "aws_vpc" "primary_site" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
      Name = "${var.vpc_name}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.primary_site.id}"
  description = "The ID of the VPC that was created."
}