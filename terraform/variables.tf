variable "domain_name" {
  description = "The public domain name"
  type        = string
}

variable "hostname" {

  description = "The hostname for the s3 bucket"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "project_environment" {
  description = "The environment of the project (e.g., dev, staging, prod)"
  type        = string
}

variable "local_website_path" {

  description = "name of the directory where we keeps website files"
  type        = string

}
