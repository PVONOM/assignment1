terraform {
  backend "s3" {
    bucket = "itcc-tfstate-shk274"
    key    = "assignment-1/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# todo: create a security group that allows inbound HTTP on port 80
resource "aws_security_group" "web" {
  name        = "assignment-1-web-sg"
  description = "Allow HTTP inbound"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# todo: create an ec2 instance using the ami, security group, and init-mp.yaml as user data

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = file("${path.module}/init-mp.yaml")

  tags = {
    Name = "assignment-1-web"
  }
}