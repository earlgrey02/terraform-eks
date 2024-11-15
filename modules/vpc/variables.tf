variable "name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "subnet_count" {
  type = number

  validation {
    condition     = log(var.subnet_count, 2) % 1 == 0
    error_message = "vpc_subnet_count must be a power of 2."
  }
}

variable "enable_nat_gateway" {
  type = bool
}

variable "single_nat_gateway" {
  type = bool
}
