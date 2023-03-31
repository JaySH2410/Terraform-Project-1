module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.web_sg
  description = "SG for web tier"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    
  }]

  egress_with_cidr_blocks = [{
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"

  }]
  tags = {
    "Name" = var.web_sg
  }

}

# from_port   = -1
    # to_port     = -1
    # protocol    = "-1"
    # cidr_blocks = "0.0.0.0/0"