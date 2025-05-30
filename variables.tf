variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.10.2.0/24"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

# Jenkins variables
variable "jenkins_ami" {
  description = "AMI ID for Jenkins master and slave"
  default     = "ami-0e35ddab05955cf57"
}

variable "jenkins_master_instance_type" {
  default = "t2.medium"
}

variable "jenkins_slave_instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key name for EC2 instances"
  default     = "mumbaipemkey"
}

variable "jenkins_slave_count" {
  default = 1
}

variable "jump_server_ami" {
  description = "AMI ID for the Jump Server"
  type        = string
  default     = "ami-0e35ddab05955cf57"
}

variable "jump_server_instance_type" {
  description = "Instance type for Jump Server"
  type        = string
  default     = "t2.micro"
}

# GitLab variables
variable "gitlab_ami" {
  description = "AMI ID for the GitLab server"
  type        = string
  default     = "ami-0e35ddab05955cf57"  # AMI ID for GitLab server
}

variable "gitlab_instance_type" {
  description = "Instance type for GitLab server"
  type        = string
  default     = "t3.medium"  # Change as per your needs
}

