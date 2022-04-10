variable "instance_name" {
    description = "Nome instância ECS"
    type        = string
    default     = "DevOps_Teste"
}

variable "instance_region" {
    description = "Região do AWS"
    type        = string
    default     = "us-west-2"
}

variable "repository_name" {
    description = "Nome repositório ECR"
    type        = string
    default     = "Repo-DevOps_Teste"
}

