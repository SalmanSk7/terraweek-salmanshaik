#provider block

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

#Code block to create ec2 instance

resource "aws_instance" "salman-day03" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = ""
  tags = {
    Name = "salman-day03-changed"
  }

  lifecycle {
    ignore_changes = [ 
      tags,
     ]
  }

  provisioner "local-exec" {
    command = "echo 'configure the EC2 instance'"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'Destroy the instance'"
  }
}

#Output the public IP of Instance after create.
output "ec2_public_ip" {
  value = aws_instance.salman-day03[*].public_ip
}