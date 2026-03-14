#mongodb instance
resource "aws_instance" "mongodb" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags = {
    Name = "${var.project}-${var.environment}-mongodb"
  }
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  connection {
    type     = "ssh"
    user     = var.ec2_instance_username
    password = var.ec2_instance_pwd
    host     = aws_instance.mongodb.private_ip
  }

   provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/bootstrap.sh",
       "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}

#redis instance
resource "aws_instance" "redis" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.redis_sg_id]
  tags = {
    Name = "${var.project}-${var.environment}-redis"
  }
}

resource "terraform_data" "redis" {
  triggers_replace = [
    aws_instance.redis.id
  ]

  connection {
    type     = "ssh"
    user     = var.ec2_instance_username
    password = var.ec2_instance_pwd
    host     = aws_instance.redis.private_ip
  }

   provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/bootstrap.sh",
       "sudo sh /tmp/bootstrap.sh redis ${var.environment}"
    ]
  }
}

#mysql instance
resource "aws_instance" "mysql" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.mysql_sg_id]
  tags = {
    Name = "${var.project}-${var.environment}-mysql"
  }
}

resource "terraform_data" "mysql" {
  triggers_replace = [
    aws_instance.mysql.id
  ]

  connection {
    type     = "ssh"
    user     = var.ec2_instance_username
    password = var.ec2_instance_pwd
    host     = aws_instance.mysql.private_ip
  }

   provisioner "file" {
    source      = "bootstrap_mysql.sh" # Local file path
    destination = "/tmp/bootstrap_mysql.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/bootstrap_mysql.sh",
       "sudo sh /tmp/bootstrap_mysql.sh mysql ${var.environment}"
    ]
  }
}


#rabbitmq instance
resource "aws_instance" "rabbitmq" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  tags = {
    Name = "${var.project}-${var.environment}-rabbitmq"
  }
}

resource "terraform_data" "rabbitmq" {
  triggers_replace = [
    aws_instance.rabbitmq.id
  ]

  connection {
    type     = "ssh"
    user     = var.ec2_instance_username
    password = var.ec2_instance_pwd
    host     = aws_instance.rabbitmq.private_ip
  }

   provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/bootstrap.sh",
       "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"
    ]
  }
}