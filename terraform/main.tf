terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
}

provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    profile = "Nginx-Server"
    region = "us-west-2"
}

# Criando a Instância EC2
resource "aws_instance" "ubuntu_server" {
    ami             = var.image_name
    instance_type   = "t2.micro"
    key_name        = aws_key_pair.my-key.key_name
    security_groups = ["${aws_security_group.allow_ssh.name}"]

    tags = {
        Name = var.instance_name
    }
    
    connection {
        type    = "ssh"
        user    = "ubuntu"
        host    = self.public_ip
    }

# Efetuando a instalação do docker & docker-compose na instância EC2
    provisioner "remote-exec" {
        inline = [
            "sudo apt-get remove docker docker-engine docker.io containerd runc",
            "sudo apt-get update",
            "sudo apt install curl -y",
            "curl -fsSL https://get.docker.com -o get-docker.sh",
            "sudo chmod +x get-docker.sh",
            "sudo sh get-docker.sh",
            "sudo docker --version",
            "sudo curl -L https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose",
            "sudo chmod +x /usr/local/bin/docker-compose",
            "sudo docker-compose --version",
            "sudo mkdir devops-teste",
            "sudo chmod 777 devops-teste",
            "cd ~/devops-teste"
        ]
    }

# Copiando docker-compose para instância EC2
    provisioner "file" {
        source      = "../../devops-teste/"
        destination = "devops-teste/"
    }
}

# Recurso para Chaves de segurança
resource "aws_key_pair" "my-key" {
    key_name    = "my-key"
    public_key  = "${file("~/.ssh/id_rsa.pub")}"
}

# Recurso para security_groups
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"

# Liberando portas de acesso 22
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

# Liberando porta de acesso 80
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

# Liberando portas de saída
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
