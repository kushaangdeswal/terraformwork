provider "aws" {
    region = "us-west-2"
}
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}
resource "aws_instance" "web" {
    for_each = var.instance_names

  ami           = data.aws_ami.ubuntu.id  # same AMI for all
  instance_type = each.value
  tags = {
    Name = each.key
  }
}
