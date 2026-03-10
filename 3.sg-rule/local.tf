locals {
  my_ip = data.http.my_ip
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}