/* resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "prod-vpc"
    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
     availability_zone = "ap-south-1a"


    tags = {
        Name = "prod-subnet-public-1"
    }
}
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "priv-subnet1" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "10.0.2.0/24"
availability_zone = "ap-south-1b"
}

resource "aws_subnet" "priv-subnet2" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "10.0.3.0/24"
availability_zone = "ap-south-1a"
}

resource "aws_db_subnet_group" "db-subnet" {
name = "db-subnet-group"
subnet_ids = ["${aws_subnet.priv-subnet1.id}", "${aws_subnet.priv-subnet2.id}"]
} */
