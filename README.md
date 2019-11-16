# adv-it_challenge

### An EC2 terraform module.

---
## Module description

There's a module to create Amazon EC2 instance with Cheap High Availability

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| ssh_key |SSH public key for connect to instance| string | |yes |
| subnet_id | The VPC Subnet ID to launch in | list | [] | yes |
| vpc_id | The id of the specific VPC | string | []] | yes |
| region | This is the AWS region | string | us-east-1 | no |
| instance_type | The type of instance to start | string | t3.nano | no |
| instance_name | The name of instance | string | current | no |
| availability_zone | The availability zone where the subnet must reside | list | us-east-1b | no |
| image_id | The EC2 image ID to launch | string | ami-00dc79254d0461090 | no |
| min_size | Min size of instances in autoscaling group | number | 1 | no|
| max_size | Max size of instances in autoscaling group | number | 1 | no|
| desired_capacity | Desired capacity of instances in autoscaling group | number | 1 | no|
| health_check_grace_period | Time (in seconds) after instance comes into service before checking health | number | 60 | no |
| default_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start | number | 60 | no |
| retention_in_days | Specifies the number of days you want to retain log events in the specified log group | number | 365 | no |
                                                                                                                     
                                                                                                                        
### Usage example
```
module "current" {
  source    = "./modules/"
  ssh_key   = "ssh-rsa AAAA..."
  subnet_id = "subnet-20cac.."
  vpc_id    = "vpc-c66..."
}
```
