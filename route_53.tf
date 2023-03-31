module "alb_record" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"
  zone_id = var.public_zone_id#data fetch
  records = [
    {
      name    = var.asg_name
      type    = "CNAME"
      ttl     = 60
      records = [module.alb.lb_dns_name]
    }
  ]
}
module "rds_record" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"
  zone_id = var.private_zone_id
  records = [
    {
      name    = var.db_name
      type    = "CNAME"
      ttl     = 60
      records = [module.db.db_instance_address]
    }
  ]
}

resource "aws_route53_zone_association" "vpc_r53_association" {
  zone_id = var.private_zone_id
  vpc_id  = module.vpc.vpc_id
}