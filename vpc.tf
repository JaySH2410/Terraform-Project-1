module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = var.vpc_name
  cidr            = var.vpc_cidr
  azs             = var.azs #data
  private_subnets = var.pri_subnet
  public_subnets  = var.pub_subnet

  enable_dns_support   = true
  enable_dns_hostnames = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  private_subnet_names     = var.pri_subnet_names
  public_subnet_names      = var.pub_subnet_names
  default_route_table_name = var.main_rt_name
  private_route_table_tags = {
    Name = var.pri_rt_name
  }
  public_route_table_tags = {
    Name = var.pub_rt_name
  }
  igw_tags = {
    Name = var.igw_name
  }
  nat_gateway_tags = {
    Name = var.nat_name
  }

}

