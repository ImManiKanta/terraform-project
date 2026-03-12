resource "aws_instance" "mongodb" {
  ami = local.ami_id
  instance_type = "t3.micro"
}