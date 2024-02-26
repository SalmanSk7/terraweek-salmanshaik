resource "aws_instance" "salman-day05" {
  ami                    = var.ami
  instance_type          = var.instance_type

  tags = {
    Name = "${var.tag_name}"
  }
}