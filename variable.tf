variable "owner_email_id" {
  default = "jay.sheth@intuitive.cloud"
}

variable "env" {
  default = "dev"
}

variable "http_protocol" {
  default = "HTTP"
}

variable "mysql_port" {
  default = 3306
}

variable "http_port" {
  default = 80
}

variable "https_protocol" {
  default = "HTTPS"
}

variable "https_port" {
  default = 443
}

variable "certificate_arn" {
  default = "arn:aws:acm:us-east-1:587172484624:certificate/4a382046-f0f6-4203-bfe5-a6319c62c318"
}

variable "vpc_name" {
  default = "jay-sheth-vpc"
}

variable "alb_name" {
  default = "jay-sheth-alb"
}

variable "asg_name" {
  default = "jay-sheth-asg"
}

variable "db_name" {
  default = "jay-sheth-rds"
}

variable "launch_template_name" {
  default = "jay-sheth-launch-template"
}

variable "private_zone_id" {
  default = "Z09600291FQN85FFRHCOB"
}

variable "public_zone_id" {
  default = "Z09694789KLKEHOHJN0T"
}

variable "web_sg" {
  default = "jay-sheth-web-sg"
}

variable "app_sg" {
  default = "jay-sheth-app-sg"
}

variable "db_sg" {
  default = "jay-sheth-db-sg"
}

variable "lb_type" {
  default = "application"
}

variable "target_grp_prefix" {
  default = "jay-"
}

variable "asg_instance_type" {
  default = "t2.micro"
}

variable "asg_min_size" {
  default = 1
}

variable "asg_max_size" {
  default = 3
}

variable "asg_desired_size" {
  default = 2
}

variable "vpc_cidr" {
  default = "15.0.0.0/16"
}

variable "pri_subnet" {
  default = ["15.0.1.0/24", "15.0.2.0/24", "15.0.3.0/24", "15.0.4.0/24", "15.0.5.0/24", "15.0.6.0/24"]
}

variable "pri_subnet_names" {
  default = ["jay-sheth-privateA-subnet", "jay-sheth-privateB-subnet", "jay-sheth-privateC-subnet", "jay-sheth-privateD-subnet", "jay-sheth-privateE-subnet", "jay-sheth-privateF-subnet"]
}

variable "pub_subnet" {
  default = ["15.0.101.0/24", "15.0.102.0/24", "15.0.103.0/24"]
}

variable "pub_subnet_names" {
  default = ["jay-sheth-publicA-subnet", "jay-sheth-publicB-subnet", "jay-sheth-publicC-subnet"]
}
variable "main_rt_name" {
  default = "jay-sheth-main-rtb"
}

variable "pri_rt_name" {
  default = "jay-sheth-private-rtb"
}

variable "pub_rt_name" {
  default = "jay-sheth-public-rtb"
}

variable "igw_name" {
  default = "jay-sheth-igw"
}

variable "nat_name" {
  default = "jay-sheth-nat"
}


variable "azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "rds-endpoint" {
  type = string
  default = "jay-sheth-rds.dns-poc-onprem.tk"
}