# Variables  

# CIDR block for VPC
# CIDR block for subnet which is a subset of CIDR block of VPC
# Availability zone which is used to create our subnet
# Instance type of EC2 instance
# With AWS, we can start adding tags to track our resources. We are using environment tag.

variable "region" {
  default = "us-east-1"
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0cf31d971a3ca20d6"
}

variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Learning"
}

variable "api_dist" {
  description = "name of the disribution file"
  type        = string
  default     = "spring-boot-hello-world-rest-api.jar"
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  default     = "nemnous"
}


variable "dist_zip" {
  type        = string
  default     = "spring-boot-hello-world-rest-api.jar.zip"
}