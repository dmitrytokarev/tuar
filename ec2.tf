provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "example" {
  ami                    = "ami-ca89eeb2"                        // us-west-2 Ubuntu 16.04
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, there" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF

  tags {
    Name = "test"
  }
}

resource "aws_security_group" "example" {
  name = "tf-example-sg"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
