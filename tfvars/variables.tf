variable "region" {
    description = "AWS region"
    type        = string
    default     = "us-west-2"
}
variable "instance_type" {
    description = "Type of the instance"
    type        = string
    default     = "t2.micro"
}
variable "instance_name" {
    description = "Name of the instance"
    type        = string
    default     = "AppServerInstance"
}
variable "secret_key" {
    description = "AWS secret key"
    type        = string
    sensitive   = true
}