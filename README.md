# ec2-web-hosting-with-terraform
This is a terraform project sample to deploy an EC2 instance to host a website. 
I've use it to initialize a web server for my Personal Portfolio.

## Backend setup
First, you need to setup the backend of the terraform application. Personally, I prefer
to use S3 as my backend. In the remote_state subdirectory, there is a main.tf, run the
command to initialize the backend. 
```bash
cd remote_state/
terraform init
terraform plan
terraform deploy
```

## Infrastructure setup
After the backend setup, make sure to configure the backend section in the main.tf to run the following commands with no errors. Moreover, configure the terraform.tfvars file with
your own. Change directory to the root project and execute the following commands.
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform deploy -var-file=terraform.tfvars
```

Finally, check the logs inside the EC2 instance to verify the user-data.sh was succesfully
executed.