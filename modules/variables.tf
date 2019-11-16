variable "ssh_key" {
  description = "SSH public key for connect to instance"
}

variable "region" {
  description = "This is the AWS region"
  default = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to start"
  default = "t3.nano"
}

variable "instance_name" {
  description = "The name of instance"
  default = "current"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type = "list"
}

variable "vpc_id" {
  description = "The id of the specific VPC"
}

variable "availability_zone" {
  description = "The availability zone where the subnet must reside"
  type    = "list"
  default = ["us-east-1b"]
}

variable "image_id" {
  description = "The EC2 image ID to launch"
  default = "ami-00dc79254d0461090"
}

variable "min_size" {
  description = "Min size of instances in autoscaling group"
  default = 1
}

variable "max_size" {
  description = "Max size of instances in autoscaling group"
  default = 1
}

variable "desired_capacity" {
  description = "Desired capacity of instances in autoscaling group"
  default = 1
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  default = 60
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
  default = 60
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  default = 365
}