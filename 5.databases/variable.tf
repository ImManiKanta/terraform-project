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

variable "zone_id" {
  type = string
  default = "Z00114331R4EBNTWP3VT8"
}

variable "domain_name" {
  type = string
  default = "manidevops.online"
}