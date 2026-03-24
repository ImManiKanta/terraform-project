locals {
  frontend_alg_sg_id = data.aws_ssm_parameter.frontend_alg_sg_id.value
  public_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_id.value)
  frontend_alb_certificate_arn = data.aws_ssm_parameter.frontend_alb_certificate_arn.value
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}