provider "aws" {
    region = "us-east-1"
}
resource "aws_s3_bucket" "sample" {
    bucket = random_pet.petname.id

    tags = {
        public_bucket = false
    }
}
resource "random_pet" "petname" {
    length = 5
    separator = "-"
}