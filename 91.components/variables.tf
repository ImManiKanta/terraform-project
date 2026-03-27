variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_id" {
  type = string
  default = "Z00114331R4EBNTWP3VT8"
}

variable "domain_name" {
  type = string
  default = "manidevops.online"
}

variable "components" {
    default = {
        # backend components are attaching to backend ALB
        catalogue = {
            rule_priority = 10
        }
        user = {
            rule_priority = 20
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        payment = {
            rule_priority = 50
        }
        # this is attaching to frontend ALB, there is only component there
        frontend = {
            rule_priority = 10
        }
    }
}