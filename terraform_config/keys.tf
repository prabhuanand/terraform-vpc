#Root account aws key confog
variable "environment" {
  default     = "devops"
  description = "aws environment"
}

variable "aws_account_name" {
  default     = "devops"
  description = "aws account name"
}

variable "aws_account_number" {
  default     = "<aws_account_number>"
  description = "aws account number"
}

variable "aws_access_key" {
  default     = "<aws key>"
  description = "aws access key"
}

variable "aws_secret_key" {
  default     = "<aws secret key>"
  description = "aws secret key"
}

variable "aws_region" {
  default     = "us-west-2"
  description = "Base AWS region"
}

variable "aws_region_1" {
  default     = "us-west-2a"
  description = "First AWS AZ"
}

variable "aws_region_2" {
  default     = "us-west-2b"
  description = "Second AWS AZ"
}

variable "aws_region_3" {
  default     = "us-west-2c"
  description = "Third AWS AZ"
}
