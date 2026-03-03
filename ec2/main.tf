
resource "aws_instance" "this" {
  count = 10
  ami           = data.aws_ami.Redhat.id
  instance_type = "t3.micro"
  vpc_security_group_ids=[aws_security_group.allow_all.id]

  tags = {
    Name = "${var.instances[count.index]}"
  }

  depends_on=[aws_security_group.allow_all]
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}