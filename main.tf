terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31"
    }
  }

  backend "s3" {
    bucket = "terraform-state-bucket-9962569e"
    dynamodb_table = "app-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "brusrojas"
  }

  required_version = ">= 1.2.0"
  
}

provider "aws" {
  region = var.region
  profile = var.profile
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "personal_portfolio_sg" {
  name        = "allow_tls"
  description = "Allow Interner traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "personal_portfolio" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = var.key_name
  user_data = "${file("user_data.sh")}"
  vpc_security_group_ids = [aws_security_group.personal_portfolio_sg.id]
  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "personal_portfolio_eip" {
  instance = aws_instance.personal_portfolio.id
  domain   = "vpc"
}
