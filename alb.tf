module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = var.alb_name

  load_balancer_type = var.lb_type

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.web_sg.security_group_id]
  create_security_group = false
  
  target_groups = [
    {
      name_prefix      = var.target_grp_prefix
      backend_protocol = var.http_protocol
      backend_port     = var.http_port
      target_type      = "instance"
      stickiness = {"enabled" = true, "type" = "lb_cookie"}
      # health check
      health_check = {
        matcher = "200-399"
        path    = "/phpinfo.php"
        interval = 120
        timeout = 30
      }
    }
  ]

  http_tcp_listeners = [
    {
      port        = var.http_port
      protocol    = var.http_protocol
      action_type = "redirect"
      redirect = {
        port        = var.https_port
        protocol    = var.https_protocol
        status_code = "HTTP_301"
      }
    }
  ]


  
   https_listeners = [
    {
      port               = var.https_port
      protocol           = var.https_protocol
      certificate_arn    = var.certificate_arn#data fetch
      target_group_index = 0
    }
  ]

  tags = {
    Environment = var.env
    Name        = var.alb_name
    Owner       = var.owner_email_id
  }
}
  