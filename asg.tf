module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = var.asg_name

  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_size
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  target_group_arns         = module.alb.target_group_arns
  vpc_zone_identifier       = module.vpc.private_subnets


  # Launch template
  launch_template_name        = var.launch_template_name
  launch_template_description = "launch temlate for asign to jay-sheth-asg"
  update_default_version      = true

  image_id          = data.aws_ami.jay-ec2.id
  instance_type     = var.asg_instance_type
  ebs_optimized     = false
  enable_monitoring = true
  user_data         = base64encode(templatefile("ud.tpl", {endpoint = trim(var.rds-endpoint, ":3306")}))
  security_groups   = [module.app_sg.security_group_id]
#
  create_iam_instance_profile = true
  iam_role_name               = "jay-sheth-ec2ssm-role"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM SSM role for ec2"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMFullAccess = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  }
#


  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]
  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }
  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name  = var.asg_name
        Owner = var.owner_email_id
      }
    },
    {
      resource_type = "volume"
      tags = {
        Name  = var.asg_name
        Owner = var.owner_email_id
      }
    },
  ]

  tags = {
    Environment = var.env
    Name        = var.asg_name
    Owner       = var.owner_email_id
  }
} 
# locals {
#   endpoint = module.db.db_instance_endpoint
# }
locals {
  vars = {
    rds-endpoint = module.rds_record.route53_record_fqdn
  }
}

#ec2 1 2