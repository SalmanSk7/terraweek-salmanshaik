terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0c9c942bd7bf113a2"
  instance_type = "t2.micro"

tags = {
  Name = "my-ec2-instance"
  }
}