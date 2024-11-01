packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "temporary_instance_mumbai" {

  source_ami    = var.temporary_instance_ami_id
  instance_type = var.temporary_instance_type
  ssh_username  = "ec2-user"
  ami_name      = local.image_name

  tags = {
    Name        = local.image_name
    Project     = var.project_name
    Environment = var.project_environment
  }

}


build {

  sources = ["source.amazon-ebs.temporary_instance_mumbai"]

  provisioner "shell" {
    script = "./setup.sh"
    execute_command  = "sudo  {{.Path}}"
  }

  provisioner "file" {
    source = "../website"
    destination = "/tmp/"
  }

 provisioner "shell" {
  inline = ["sudo cp -r  /tmp/website/* /var/www/html/","sudo rm -rf  /tmp/website "]
 }
    
}
