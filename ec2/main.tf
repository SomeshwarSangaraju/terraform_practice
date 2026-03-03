
resource "aws_instance" "this" {
  ami           = data.aws_ami.Redhat.id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform"
  }
}
