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
resource "aws_instance" "example" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
}

resource "aws_instance" "example_2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    depends_on = [aws_s3_bucket.example]
}
resource "aws_eip" "ip" {
   instance = aws_instance.example.id
}
resource "aws_s3_bucket" "example" {

}
