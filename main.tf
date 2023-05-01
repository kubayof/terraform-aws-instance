terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
  profile = "dce"
}

resource "aws_instance" "cluster" {
  tags = {
    "Name": "test-provisioner"
  }
  ami = "ami-009c5f630e96948cb"
  instance_type = "t2.micro"
  subnet_id = "subnet-07d3b96a2d1e16e3d"
  key_name = "aws-eb"
  user_data = <<EOT
  #!/bin/bash

  echo "Hello world" > /home/nonroot/index.html
  EOT
}