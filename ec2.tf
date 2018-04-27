provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-5c97f024" // us-west-2 Ubuntu 16.04
  instance_type = "t2.micro"

  tags {
    Name = "test"
  }
}
