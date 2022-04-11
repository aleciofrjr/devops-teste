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

variable "image_name" {
    description = "Nome cluster ECS"
    type        = string
    default     = "image-devops_teste"
}

