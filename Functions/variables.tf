variable "aws_region" {
    description = "AWS region for all resources."
    type        = string
    default     = "us-west-2"
}
variable "instance_type" {
    description = "Type of EC2 instance to use."
    type        = string
    default     = "t2.micro"
}