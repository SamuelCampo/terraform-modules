variable "application_name" {type = string}
variable "dns_zone_id" {}
variable "dns_record_name" {type = string}
variable "elasticbeanstalk_hosted_zone_id" {}
variable "environment_tier" {type = string}
variable "settings" {type = map}
variable "stack_name" {type = string}
variable "tags" {type = map}

output "endpoint_url" {
    value = aws_elastic_beanstalk_environment.eb_application_environment.endpoint_url
}