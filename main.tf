provider "aws" {
  region = var.aws_region
}

## 1st create only s3 bucket 
##After creating s3 bucket commenting it out
/* resource "aws_s3_bucket" "employeeportal" {
  bucket = "employeeportalbucket"
  acl    = "public-read-write"

  tags = {
    Name        = "employeeportalbucket"
   
  }
}  */
data "aws_s3_bucket" "employeeportal" {
  bucket = "employeeportalbucket"
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "employeeportalsecretkey" {
  key_name   = "employeeportalsecretkey" # Create a "myKey" to AWS!!
  public_key = var.public_key

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./employeeportalsecretkey.pem"
  }
}
#Create security group with firewall rules
/* resource "aws_security_group" "security_port" {
  name        = "security_port"
  description = "security group "

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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
} */
resource "aws_db_instance" "employeeportaldatabase" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "14.2"
  instance_class         = "db.t3.micro"
  name                   = "postgresdatabase"
  username               = "shireenazad"
  password               = "postgres"
  publicly_accessible    = true
  skip_final_snapshot    = true
  port                   = 5432
security_group_names =["${aws_security_group.db.id}"]

}
resource "aws_instance" "employeePortal" {
  ami           = "ami-0756a1c858554433e"
  key_name      = "employeeportalsecretkey"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.prod-subnet-public-1.id

  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

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
}
