variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  default = "ami-088d38b423bff245f" # Replace with your preferred AMI ID
}

variable "key_name" {
  #default = "jenkins_aws_kp"
  default = "jenkinsKP"
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

variable "eks_version" {
  type = string
  
  default = "1.30"
}

variable "eks_cluster_version" {
  type = string
  
  default = "1.30"
}

variable "eks_cluster_name" {
  type = string
  
  default = "cicd-eks-cluster"
}

variable "eks_cluster_desired_capacity" {
  default = 2 
}


variable "eks_cluster_min_capacity" {
  default = 1 
}

variable "eks_cluster_max_capacity" {
  default = 3 
}
