### What am I learning - Best Practices
- How to build APIs in Python - https://realpython.com/api-integration-in-python/ , according to this


# Part-1 - Creating the HTTP Python Server

### Task 1 - Identify Resources 
- describe them as plural nouns - `/buckets`
- define your endpoints - HTTP Method | API Endpoint | Description 
    - `/buckets`- Get a list of all buckets
    - `/list-bucket-contents` - Get a list of all contents, nested and otherwise of a bucket


### Resources I am currently pointed to - 
- https://dev.to/aws-builders/how-to-list-contents-of-s3-bucket-using-boto3-python-47mm - List Contents of S3 Buckets using Boto3




### What am i assuming / setting up things - 
VPC CIDR: 10.0.1.0/26
Subnet CIDR: 10.0.1.1/26
Availability Zone: No preference
Route Table: Associated with subnet, route 0.0.0.0/0 to Internet Gateway
EC2 Public IP: Enabled
Security Group Source Type: Anywhere (0.0.0.0/0 for IPv4)
Security Group Inbound Rules: Allow HTTP (port 80) and HTTPS (port 443)
Python HTTP Server Listening Address: 0.0.0.0
