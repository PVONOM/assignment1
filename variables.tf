variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

# todo: add a variable for the ami id

variable "ami_id" {
  description = "Ubuntu 24.04 LTS AMI for us-east-1"
  type        = string
  default     = "ami-025d99823a4caad37"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}