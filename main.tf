resource "aws_instance" "terraform" {
  ami = data.aws_ami.ami_id.id
  instance_type = "t3.micro"

  tags={
    Name="Terraform"
    value="true"
  }  
}

# resource "aws_route53_record" "this" {
#   zone_id = var.zone_id
#   name    = "${aws_instance.terraform}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_eip.lb.public_ip]
# }

resource "aws_security_group" "allow_all" {
  name   = "allow_all"
  description = "created through terraform"
  ingress {
    from_port       = 0 
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }
   egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
