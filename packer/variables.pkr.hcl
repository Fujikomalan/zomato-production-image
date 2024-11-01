variable "project_name" {
  type        = string
  description = "my project name"
  default     = "zomato"
}

variable "project_environment" {
  type        = string
  description = "project environment"
  default     = "production"
}


variable "temporary_instance_ami_id" {
  type        = string
  description = "AMI id of temporary instance created by packer"
  default     = "ami-0e53db6fd757e38c7"
}

variable "temporary_instance_type" {
  type        = string
  description = "Type of temporary Instance Created By Packer"
  default     = "t2.micro"
}

locals {
  timestamp  = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image_name = "${var.project_name}-${var.project_environment}-${local.timestamp}"
}
