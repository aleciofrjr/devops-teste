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
    name = var.repository_name
}

# Criando cluste ECS
resource "aws_ecs_cluster" "cluster-devops_teste" {
    name = var.cluster_name
}

# Build da imagem e push no ECR
resource "docker_registry_image" "image-devops_teste" {
    name = var.image_name
    
    build {
        context     = "../"
        dockerfile  = "Dockerfile"
    }
}


#resource "docker_image" "centos" {
#    name = "centos:latest"
#}

#resource "docker_container" "centos" {
#    image   = "docker_image.centos.latest"
#    name    = "centos_container"
#}

