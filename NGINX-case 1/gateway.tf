
# Provides a resource to create a VPC Internet Gateway.
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
      Name = var.igw_name
    Environment = var.environment_tag
  }
}