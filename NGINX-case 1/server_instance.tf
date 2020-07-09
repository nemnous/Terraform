
resource "aws_instance" "nemnous" {
  ami           = var.server_ami
  instance_type = var.server_instance_type
  subnet_id     = aws_subnet.subnet_public.id
  
  
  vpc_security_group_ids = [aws_security_group.sg_dalpay.id]
  key_name = var.instance_key_pair
  tags = {
    Name = "Dalpay Terraform"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.nemnous.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}

resource "null_resource" "connect_ip" {
    triggers = {
    public_ip = aws_instance.nemnous.public_ip
  }
  connection {
    type = "ssh"
    host        = aws_eip.ip.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key)
  }

  provisioner "remote-exec" {
    inline = ["yum check-update",
    "sudo yum update -y",
"sudo amazon-linux-extras enable nginx1",
 "sudo yum -y install nginx",
  "sudo service nginx start",
   "sudo chkconfig nginx on"]
  }
  depends_on = [aws_eip.ip]
  }