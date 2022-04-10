terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  region  = "eu-central-1"
}



resource "aws_instance" "homework_instanse" {
  instance_type = "t2.micro"
  ami = "ami-0d527b8c289b4af7f"
   
  subnet_id = var.subnet_ids[0]
  security_groups = [var.sg_id]

  key_name               = "aleksandr_dubinin@epam.com"
  user_data = "${file("install_nginx.sh")}"

	tags = {
    	owner = "aleksandr_dubinin@epam.com"
	Name = "Homework_instancve"
	}
	volume_tags = {
    	owner = "aleksandr_dubinin@epam.com"
	}
}

resource "aws_db_instance" "homework" {
  identifier             = "homework"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  username               = var.db_user
  password               = var.db_pass
  allocated_storage      = 5
  max_allocated_storage  = 0
  storage_type           = "gp2"
  vpc_security_group_ids = [var.sg_id]
  skip_final_snapshot    = true

  tags = {
    Name = "DB"
    owner = "aleksandr_dubinin@epam.com"
  }
}
