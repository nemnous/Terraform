# -----------PROVIDERS------------------
variable "region" {
  default = "eu-west-1"
}

# -------------VPC------------------------
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default = "dalpay-vpc"
}

# ----------------Gateway------------------
variable "igw_name" {
  description = "Name of the gateway"
  default = "dalpay-igw"
}

# -----------------Subnets-------------------
variable "subnet_public_name" {
  description = "Name of the public subnet"
  default = "jb-pub-subnet"
}

variable "subnet_private_name" {
  description = "Name of the private subnet"
  default = "app-pvt-subnet"
}

variable "cidr_subnet_public" {
  description = "CIDR block for public the subnet"
  default = "10.0.10.0/24"
}


variable "cidr_subnet_private" {
  description = "CIDR block for private the subnet"
  default = "10.0.20.0/24"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "eu-west-1a"
}

# ----------------Routetable------------------

variable "rtb_private_name" {
  description = "Name of the private Route table"
  default = "private-rt"
}


variable "rtb_public_name" {
  description = "Name of the public Route table"
  default = "public-rt"
}

# ------------------Instance----------------------------

variable "server_ami" {
  description = "server AMI"
  default = "ami-0c3e74fa87d2a4227"
}

variable "server_instance_type" {
  description = "server instance"
  default = "t2.micro"
}

variable "instance_key_pair" {
  description = "key pair"
  default = "dalberry-useraccess"
}

variable "private_key" {
  description = "key pair"
  default = "dalberry-useraccess.pem"
}
# -----------------------------------------
variable "environment_tag" {
  description = "Environment tag"
  default = "Learning"
}