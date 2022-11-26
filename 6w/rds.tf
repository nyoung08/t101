provider "aws" {
  region = "ap-northeast-2"
}

data "aws_kms_secrets" "creds" {
  secret {
    name    = "dbusercred"
    payload = file("${path.module}/db-usercreds.yml.encrypted")
  }
}

locals {
  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["dbusercred"])
}


resource "aws_db_subnet_group" "mydbsubnet" {
  name       = "mydbsubnetgroup"
  subnet_ids = [aws_subnet.mysubnet3.id, aws_subnet.mysubnet4.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "test" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = var.db_name
  db_subnet_group_name   = aws_db_subnet_group.mydbsubnet.name

  # Pass the secrets to the resource
  username = local.db_creds.username
  password = local.db_creds.password
}


