terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
        docker = {
            source  = "kreuzwerker/docker"
            version = "~> 2.13.0"
    }
  }
}

provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    profile = "Nginx-Server"
    region = var.instance_region
}

# Criando repositório ECR
resource "aws_ecr_repository" "repo-devops_teste" {
    name = "repo-devops_teste"
}


#resource "docker_image" "centos" {
#    name = "centos:latest"
#}

#resource "docker_container" "centos" {
#    image   = "docker_image.centos.latest"
#    name    = "centos_container"
#}

