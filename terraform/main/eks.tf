# EKS - Define the EKS cluster in AWS with auto-scaling node groups with desired(3), min(2), max(5) nodes

module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    version         = "17.24.0"
    cluster_name    = var.eks_cluster_name
    cluster_version = var.eks_cluster_version 
    vpc_id          = aws_vpc.main_vpc.id
    subnets         = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_eks.id]
    node_groups = {
      eks_nodes = {
        desired_capacity = var.eks_cluster_desired_capacity 
        max_capacity     = var.eks_cluster_max_capacity 
        min_capacity     = var.eks_cluster_min_capacity 
      #  instance_type = "t2.medium" - this value is coming from /.terraform/modules/eks/locals.tf
        key_name      = var.key_name
        tags = {
          Name = "cicd-eks-node"
        }
      }
    }
  }
