### What am I learning - Best Practices
- How to build APIs in Python - https://realpython.com/api-integration-in-python/ , according to this
- AWS Boto3 Resource vs Client - access techniques and differences

### Resources I am currently pointed to - 
- https://dev.to/aws-builders/how-to-list-contents-of-s3-bucket-using-boto3-python-47mm - List Contents of S3 Buckets using Boto3

### What am i assuming / setting up things - 
- VPC CIDR: 10.0.1.0/26
- Subnet CIDR: 10.0.1.0/26
- Availability Zone: No preference
- Route Table: Associated with subnet, route 0.0.0.0/0 to Internet Gateway
- EC2 Public IP: Enabled
- Security Group Source Type: Anywhere (0.0.0.0/0 for IPv4)
- Security Group Inbound Rules: Allow HTTP (port 80) and HTTPS (port 443)
- Python HTTP Server Listening Address: 0.0.0.0
- IAM Permissions - Once code is deployed to EC2 - it runs boto3, which in turn means EC2 needs permissions to access S3 bucket

### Deploying to AWS - Considerations? 
-  EC2 needs to have a perm


### Writing the Terraform Code for this -
- Selected Order of Creation - VPC -> Internet Gateway -> Route Table -> Subnet -> EC2 (t2.micro) -> S3 Bucket
- VPC and Internet Gateway - can be created back to back and associated, we can move on to next
- Route Table and Subnet - Creation of a Route Table, with a route to new Internet Gateway - can be created and associated with Subnet
- EC2 and S3 can come in any order

