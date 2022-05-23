provider "aws" {
  region              = var.aws_region
  profile             = "shireen_syed"
}

## 1st create only s3 bucket 
resource "aws_s3_bucket" "employeeportal" {
  bucket = "employeeportalbucket"
  acl    = "public-read-write"

  tags = {
    Name        = "employeeportalbucket"
   
  }
}
/* resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "employeeportalsecretkey" {
  key_name   = "employeeportalsecretkey" # Create a "myKey" to AWS!!
  public_key = file("/Users/shireenazad/.ssh/id_rsa.pub")

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./employeeportalsecretkey.pem"
  }
}

#Create security group with firewall rules
resource "aws_security_group" "security_port" {
  name        = "security_port"
  description = "security group "

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_port"
  }
}

resource "aws_instance" "employeePortal" {
  ami             = "ami-0756a1c858554433e"
  key_name        = "employeeportalsecretkey"
  instance_type   = var.instance_type
  security_groups = ["security_port"]
  tags = {
    Name = "employeeportal_ec2_instance"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.private_key
    timeout     = "4m"
  }
} */
