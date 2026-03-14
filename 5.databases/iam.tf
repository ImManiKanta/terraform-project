resource "aws_iam_role" "mysql" {
  name               = "RoboshopMysql"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

   tags = {
        Name = "${var.project}-Mysql-${var.environment}"
    }
  
}

resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::166557488034:policy/roboshop_mysql_ssm_read"
}

# Create the instance profile
resource "aws_iam_instance_profile" "mysql" {
  name = "${var.project}-Mysql-${var.environment}"
  role = aws_iam_role.mysql.name
}