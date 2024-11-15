include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id          = "vpc-mock"
    private_subnets = ["subnet-mock-1", "subnet-mock-2"]
  }
}

inputs = {
  cluster_name            = "test-dev"
  cluster_version         = "1.31"
  endpoint_public_access  = true
  endpoint_private_access = false
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
  }
  vpc_id     = dependency.vpc.outputs.vpc_id
  subnet_ids = dependency.vpc.outputs.private_subnets
  managed_node_groups = {
    node-group-1 = {
      name           = "node-group-1"
      desired_size   = 1
      min_size       = 1
      max_size       = 1
      instance_types = ["t2.medium"]
      subnets        = [dependency.vpc.outputs.private_subnets[0]]
    }
  }
}
