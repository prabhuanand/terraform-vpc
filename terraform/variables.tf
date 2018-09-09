variable "vpc_cidr" {
  description = "CIDR for the  VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr_region_1" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.10.0/24"
}

variable "private_subnet_cidr_region_2" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.11.0/24"
}

variable "private_subnet_cidr_region_3" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.12.0/24"
}

variable "public_subnet_cidr_region_1" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.20.0/24"
}

variable "public_subnet_cidr_region_2" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.21.0/24"
}

variable "public_subnet_cidr_region_3" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.22.0/24"
}

variable "bastion_subnet_cidr" {
  description = "CIDR for the bastion Subnet"
  default     = "10.0.0.0/24"
}

variable "version" {
  description = "Code Version"
  default     = "1.0"
}

variable "prabhu_ip" {
  description = "Prabhu's IP Address"
  default     = "24.6.30.72/32"
}
