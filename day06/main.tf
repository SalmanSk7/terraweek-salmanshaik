
#VPC block
resource "aws_vpc" "vpc" {
  cidr_block        = var.cidr_block
  instance_tenancy  = "default"

  tags = {
    Name = var.vpc
  }
}
#Internet gateway and attach to vpc
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# Public subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_subnet
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_public_name
  }
}

# Route table and assosiate with subnet
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = var.routetable_name
  }
}

resource "aws_route_table_association" "rt-assosiate" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.routetable.id
}

#Security group 
resource "aws_security_group" "security-group" {
  name   = "sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  egress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
}

# Instance
resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet.id
  associate_public_ip_address = true
  security_groups = ["${aws_security_group.security-group.id}"]

  tags = {
    Name = var.aws_instance_name
  }
}
