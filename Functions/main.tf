provider "aws" {
    region = var.aws_region
}
data "aws_ami" "amazon_linux" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}
resource "aws_instance" "example" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    user_data = file("userdata.tftpl")
    tags = {
     Name = "ExampleInstance"
    }
}