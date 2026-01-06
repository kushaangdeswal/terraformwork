
provider "aws" {
    region = var.region
}
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}
resource "aws_instance" "app_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    associate_public_ip_address = true
    tags = {
        Name = var.instance_name
    }
    vpc_security_group_ids = [module.vpc.default_security_group_id]
    subnet_id = module.vpc.public_subnets[0]
}   
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.19.0"

    name = "example-vpc"
    cidr = "10.0.0.0/16"

    azs = ["us-west-2a", "us-west-2b", "us-west-2c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets = ["10.0.101.0/24"]

    enable_dns_hostnames = true

}