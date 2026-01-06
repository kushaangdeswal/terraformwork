
provider "aws" {
    region = var.region
}
provider "random" {}
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}
resource "aws_instance" "main" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
}
resource "random_pet" "instance" {
    length = 2
}
resource "aws_bucket" "storage" {
    bucket = "my-app-storage-${random_pet.instance.id}"
    acl    = "private"
}