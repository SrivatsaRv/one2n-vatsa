variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "20.0.1.0/26"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "20.0.1.0/28"
}

variable "availability_zone" {
  description = "The Availability Zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0e86e20dae9224db8" ## Ubuntu Server 24.04 LTS (HVM), SSD Volume Type Image 
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "tf-created-s3-bucket"
}