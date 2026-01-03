variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string 
  default = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  type = string 
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a" 
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "env_prefix" {
  type = string
  default = "staging-jenkins"
  
}

variable "instance_type" {
   description = "EC2 Instance Type"
   type = string
   default = "t3.micro"
}
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "demo-kp" #change to your keypair
}