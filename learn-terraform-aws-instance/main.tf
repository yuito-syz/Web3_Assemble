terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1a"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0218d08a1f9dac831"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0035e89e0183b7fb4"]
  subnet_id              = "subnet-03ed550242cd53365" // goodbooking-subnet-1a
  //subnet_id               = "" //goodbooking-subnet-1c
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
