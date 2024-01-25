variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Portfolio Server"
}

variable "ami_id" {
  description = "Value of the ID for the EC2 AMI"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}

variable "profile" {
  description = "Profile to authenticate to AWS"
  type        = string
  default     = "Default"
}

variable "key_name" {
  description = "Key Name"
  type        = string
  default     = ""
}

variable "region" {
  type = string
  default = "us-east-1"
}
