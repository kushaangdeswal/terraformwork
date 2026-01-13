variable "instance_names" {
  description = "Map of project names to configuration."
  type        = map(string)
  default = {
    web = "t2.micro"
    app = "t3.medium"
    db = "t3.large"
  }
}

    