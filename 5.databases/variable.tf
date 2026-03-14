variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "ec2_instance_username" {
  type = string
  sensitive = true
}

variable "ec2_instance_pwd" {
  type = string
  sensitive = true
}