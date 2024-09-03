# Assignment Submission - One2N x Srivatsa

### Completed Items 
- [✅] Part-1 - HTTP Service in Python Exposing a GET Endpoint to an S3 Bucket Path
- [✅] Part-2 - Terraform Layout to Provision Infrastructure for Code Above

### Bonus Points 
- [✅] Bonus Point - Handle errors for non-existing paths
- [❌] Bonus Point - Deploy Service on HTTPS
- [✅] Bonus Point - Short Video Demo Recording / A Good Readme explaning design decisions, assumptions

### NOTE - INFRASTRUCTURE IS HOSTED LIVE UNTIL 3rd SEPTEMBER 23:59 IST 



## Requirements - 
- Ensure you have Git installed on your machine - [Click Here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Ensure your system has Terraform Installed - [Click Here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Python 3.x is required, and install it with an IDE of choice - [Click Here](https://code.visualstudio.com/docs/python/python-tutorial)
- Configure `aws-cli` with `~/.aws` directory for Terraform and Boto3 SDK - [Click Here](https://wellarchitectedlabs.com/common/documentation/aws_credentials/)


## Action On - Local Machine (Laptop)
- On your Linux Machine - go to `cd /home`
- Clone Terraform Repository - `git clone https://github.com/SrivatsaRv/one2n-assignment-aws-terraform-infra.git`


### Step-1 - Provision the AWS infrastructure with Terraform (EXECUTE THIS ON LOCAL MACHINE)
- Confirm terraform installation on your machine with - `terraform --version`
- Navigate to Terraform Working Directory -  `cd one2n-assignment-aws-terraform-infra`, 
- Initialize Terraform - `terraform init`
- Verify and Format Terraform Code (optional) - `terraform fmt` and `terraform validate` - Once green - proceed with 
- Apply terraform - `terraform apply` - this will create all resources mentioned in (One2N_Assignment.drawio.png)
- You should now have a working setup deployed in your AWS as per default region configured in AWS account. 


### Step-2 - Setup the Flask app with Install Script and Run It (EXECUTE THIS ON PROVISIONED EC2 INSTANCE)
- Use AWS session manager , and copy over your credential files to ec2-user's `/home`, create and populate `~/.aws` directory on EC2
- Clone the Python HTTP server repository with - `git clone https://github.com/SrivatsaRv/one2n-vatsa.git` 
- Navigate to directory with `cd /one2-vatsa` and run the bash script with `bash install_flask_app.sh`
- Get it running with `python3 python-http-s3.py`  - test it if its all showing up good, 
- You will now have the Flask App running - access it with `http://<public-ec2-ip>:5000/list-bucket-contents`
- (optional - have created a `flask-app.service` file for systemd setup if you would like to run across reboots automatically)
### Terminate all resources 
- Use `terraform destroy` to cleanup after you have tested to your satisfaction

## Assumptions -
- You have configured your AWS Root Account -> Created an IAM Account (Administrators) , 
- Once S3 is created , you will populate the S3 contents yourselves , whatever directory structure you want
- `flask-app.service` has been added, to configure in `etc/systemd/system` directory, will make the service persistent across reboots
- Run `systemctl reload daemon` and `systemctl start flask-app.service` and `systemctl enable flask-app.service` if you setup systemd


## Notice 
- Ensure you do not include `~/.aws` file in your Git repo , it should stay in your `/home` path



### Proposed Architecture for Assignment
![Proposed Architecture](One2N_Assignment.drawio.png)