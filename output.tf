# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

# ALB Outputs
output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.alb.alb_dns_name
}

output "alb_sg_id" {
  description = "Security group ID of the ALB"
  value       = module.alb.alb_sg_id
}

# ASG Outputs
output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.asg.asg_name
}
