variable "instance_name" {
  description = "Value of the EC2 instance's Name tag."
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "t4g.nano"
}
