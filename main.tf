module "vpc" {
  source = "./module/vpc"
  cidr   = "10.0.0.0/16"
  azs    = ["ap-south-1a", "ap-south-1b"]
}

module "alb" {
  source         = "./module/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "asg" {
  source          = "./module/asg"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  target_group_arn = module.alb.target_group_arn
  alb_sg_id       = module.alb.alb_sg_id
  ami_id          = "ami-02b8269d5e85954ef"
}



