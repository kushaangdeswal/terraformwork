terraform {
    required_version = "~> 1.3"
  cloud {
    organization = "kusdeswa"

    workspaces {
      name = "kusdeswa"
 
    }
   }
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.27"
        }
    }
}