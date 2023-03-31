module "app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.app_sg
  description = "SG for app tier"
  vpc_id      = module.vpc.vpc_id


  # ingress_with_cidr_blocks = [{
  #   from_port   = -1
  #   to_port     = -1
  #   protocol    = "-1"
  #   cidr_blocks = "0.0.0.0/0"

  # }]


  ingress_with_source_security_group_id = [{
    from_port                = var.http_port
    to_port                  = var.http_port
    protocol                 = "tcp"
    source_security_group_id = module.web_sg.security_group_id
    }, {
    from_port                = var.https_port
    to_port                  = var.https_port
    protocol                 = "tcp"
    source_security_group_id = module.web_sg.security_group_id
  }]
  #TRY: ignore 443 port
  egress_with_cidr_blocks = [{
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]

  tags = {
    "Name" = var.app_sg
  }
}

