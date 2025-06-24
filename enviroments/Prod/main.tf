module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  name_tag        = var.name_tag
  vpc_name        = var.vpc-name
}


module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  public_subnet_id  = module.vpc.public_subnet_ids
  private_subnet_id = module.vpc.private_subnet_ids
  vpc_id            = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnets
  private_subnet_azs = var.azs

  public_instance_count  = 2
  private_instance_count = 2
}




# Public Launch Template
module "launch_template_public" {
  source = "../../modules/launch_template_sg"
  name_prefix = "public"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs         = var.public_subnets
  sg_id = module.ec2.public_sg

}


module "asg" {
  source = "../../modules/asg"
  name = var.vpc-name
  min = var.min
  max = var.max
  subnet_ids = module.vpc.public_subnet_ids
  launch_temp_id = module.launch_template_public.launch_template_id
}




module "alb" {
  source              = "../../modules/alb"
  name                = "my-app-alb"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  public_sg_id        = module.ec2.public_sg  # From your EC2 module
  asg_name            = module.asg.asg_id     # From your ASG module
  target_port         = 80                    # Must match your instance port
  health_check_path   = "/"
}

