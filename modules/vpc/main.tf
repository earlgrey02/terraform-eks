module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  public_subnets     = [for i in range(var.subnet_count / 2) : cidrsubnet(var.cidr, log(var.subnet_count, 2), i)]
  private_subnets    = [for i in range(var.subnet_count / 2) : cidrsubnet(var.cidr, log(var.subnet_count, 2), i + (var.subnet_count / 2))]
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  tags = {
    CreatedBy = "Terraform"
  }
}
