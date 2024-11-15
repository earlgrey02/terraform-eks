variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "endpoint_public_access" {
  type = bool
}

variable "endpoint_private_access" {
  type = bool
}

variable "cluster_addons" {
  type = map(any)
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "managed_node_groups" {
  type = map(any)
}
