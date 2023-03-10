/* Simple e-mail service */

terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 3.0"
      configuration_aliases = [aws.default, aws.global, aws.createat]
    }
  }
}
