resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Environment = var.environment_tag
    Name = var.vpc_name
  }
}