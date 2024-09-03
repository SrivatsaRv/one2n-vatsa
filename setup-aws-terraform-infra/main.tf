provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "tf-created-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "tf-created-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "tf-created-subnet"
  }
}

resource "aws_route_table" "tf-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tf-created-route-table"
  }
}

resource "aws_route_table_association" "subnet-route-table-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.tf-route-table.id
}

resource "aws_security_group" "tf-created-http-https-sg" {
  vpc_id = aws_vpc.main-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-allow-http-https"
  }
}

resource "aws_instance" "flask-web-server" {
  ami             = "ami-02c21308fed24a8ab"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.tf-created-http-https-sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y python3 python3-pip
    git clone https://github.com/SrivatsaRv/one2n-vatsa.git /home/ubuntu/ && cd one2n-vatsa/
    pip3 install -r requirements.txt --break-system-packages
    # Add commands to start your Flask app
  EOF

  tags = {
    Name = "tf-created-ec2"
  }
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "tf-created-s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
}