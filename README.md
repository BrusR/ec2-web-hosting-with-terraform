# ec2-web-hosting-with-terraform
This is a terraform project sample to deploy a public EC2 instance in the default VPC, which then I configured to host my Personal Portfolio.

## Backend setup
First, you need to setup the backend of the terraform application. Personally, I prefer to use S3 as my backend. Therefore the S3 bucket to save the project state needs to be created first. In order to to this, cd to the remote_state subdirectory and run the command to initialize the backend. 
```bash
cd remote_state/
terraform init
terraform plan
terraform apply
```

## Infrastructure deployment
After the backend setup, make sure to configure the backend section in the main.tf to run the following commands. Moreover, configure the terraform.tfvars file with
your own parameters, then change directory to the root project and execute the following commands.
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Finally, check the logs inside the EC2 instance to verify the user-data.sh was succesfully executed. This is done by connecting through SSH to you newly created instance and checking the file /var/log/cloud-init-output.log