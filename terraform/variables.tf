variable "instance_region" {
    description = "Região do AWS"
    type        = string
    default     = "us-west-2"
}

variable "repository_name" {
    description = "Nome repositório ECR"
    type        = string
    default     = "repo-devops_teste"
}

variable "cluster_name" {
    description = "Nome cluster ECS"
    type        = string
    default     = "cluster-devops_teste"
}

variable "instance_name" {
    description = "Nome instância EC2"
    type        = string
    default     = "ec2_name"
}

variable "image_name" {
    description = "Imagem da instância EC2"
    type        = string
    default     = "ami-0892d3c7ee96c0bf7"
}

