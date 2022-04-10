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

resource "docker_image" "centos" {
    name = "centos:latest"
}

resource "docker_container" "centos" {
    image   = "docker_image.centos.latest"
    name    = "centos_container"
}

