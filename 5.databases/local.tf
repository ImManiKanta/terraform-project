locals {
  ami_id = data.aws_ami.joindevops.id
  private_subnet_id = data.aws_ssm_parameter.private_subnet_id.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}