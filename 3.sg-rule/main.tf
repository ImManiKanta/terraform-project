resource "aws_security_group_rule" "bastion_internet" { #Accepting connection from internet to bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = local.my_ip #my ip address
  security_group_id = local.bastion_sg_id
}