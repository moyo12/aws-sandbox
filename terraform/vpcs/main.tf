provider "aws" {
  profile = "calpoly-moayala"
  region = "us-west-2"
}

provider "aws" {
  profile = "calpoly-moayala"
  region = "us-east-1"
  alias = "east"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "${var.vpc_cidr}"
  vpc_name = "${var.vpc_name}"
  
}


module "subnet" {
  source = "./modules/subnet"

  vpc_id = "${module.vpc.vpc_id}"
  private_subnet = "${var.private_subnet}"
  public_subnet  = "${var.public_subnet}"
}

#Code Below builds Network stack for the US-EAST-1 region. 
module "vpc_east" {
  source = "./modules/vpc"
  providers = {
    aws = "aws.east"
  }
  vpc_cidr = "${var.vpc_cidr_east}"
  vpc_name = "${var.vpc_name_east}"
  
}

module "subnet_east" {
  source = "./modules/subnet"
  providers = {
    aws = "aws.east"
  }
  vpc_id = "${module.vpc_east.vpc_id}" 
  private_subnet = "${var.private_subnet_east}"
  public_subnet = "${var.public_subnet_east}"
}
