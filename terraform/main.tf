terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "project_srv_gab" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0fa59a2fbd0959d02"]

  # User data script
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y openssh-server
    sudo mkdir -p /home/ubuntu/.ssh
    sudo chmod 700 /home/ubuntu/.ssh
    echo "${file("~/.ssh/id_rsa.pub")}" | sudo tee -a /home/ubuntu/.ssh/authorized_keys >/dev/null
    sudo chmod 600 /home/ubuntu/.ssh/authorized_keys
    sudo systemctl restart sshd
    sudo apt install -y nginx
    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo apt install -y build-essential
    sudo apt install -y net-tools
  EOF

  # Connection configuration for the file provisioner
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  # Copy SSH key to the instance
  provisioner "file" {
    source      = "~/.ssh/id_rsa.pub"
    destination = "/home/ubuntu/.ssh/authorized_keys"
  }

  tags = {
    Name = "project_srv_gab"
  }
}

output "instance_details" {
  value = {
    id               = aws_instance.project_srv_gab.id
    public_ip        = aws_instance.project_srv_gab.public_ip
    private_ip       = aws_instance.project_srv_gab.private_ip
    instance_type    = aws_instance.project_srv_gab.instance_type
    availability_zone = aws_instance.project_srv_gab.availability_zone
    # Add more attributes as needed
  }
}
