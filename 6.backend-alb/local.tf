locals {
  backend_alg_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  private_subnet_id = data.aws_ssm_parameter.private_subnet_id.value
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}