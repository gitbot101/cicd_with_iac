variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  # default = "ami-088d38b423bff245f" # Replace with your preferred AMI ID -Available in us-east-2 only
  default = "ami-0166fe664262f664c" # Replace with your preferred AMI ID - Available in us-east-1 only
}

variable "key_name" {
  default = "jenkins_aws_kp"
}

variable "desired_capacity" {
  default = 1
}

variable "max_size" {
  default = 2
}

variable "min_size" {
  default = 1
}

variable "userdata_file" {
  type = string
  
  default = "user_data.sh"
}
