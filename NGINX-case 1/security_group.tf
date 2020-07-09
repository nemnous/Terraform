resource "aws_security_group" "sg_dalpay" {
  name   = "dalpay_security-tf"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.106.181.5/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["103.106.181.5/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

#   tags {
#     name = "dalpay_security-tf"
#     Environment = var.environment_tag
#   }
}
