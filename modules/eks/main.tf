module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  cluster_endpoint_public_access  = var.endpoint_public_access
  cluster_endpoint_private_access = var.endpoint_private_access
  cluster_addons                  = var.cluster_addons
  vpc_id                          = var.vpc_id
  subnet_ids                      = var.subnet_ids
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }
  eks_managed_node_groups = var.managed_node_groups
  tags = {
    CreatedBy = "Terraform"
  }
}
