#provider block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key = "terraform.tfstate"
    region = "ap-south-1" 
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "salman-day04" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = ""
  tags = {
    Name = "salman-day04"
  }
}

output "ec2_public_ip" {
  value = aws_instance.salman-day04.public_ip
}