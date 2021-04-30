/* Route53 DNS zones and records */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default, aws.global ]
    }
  }
}