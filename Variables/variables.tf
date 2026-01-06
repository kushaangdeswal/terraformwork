variable "instance_name" {
    description = "Name of the instance"
    type        = string
    default     = "AppServerInstance"
}
variable "instance_type" {
    description = "Type of the instance"
    type        = string
    default     = "t2.micro"
}