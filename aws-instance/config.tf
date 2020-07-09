provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "nemnous" {
  ami           = "ami-0a0ddd875a1ea2c7f"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.nemnous.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.nemnous.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}