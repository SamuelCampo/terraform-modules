resource "aws_iam_role" "eb_application_service_role" {
    provider = aws.default

    name = var.service_role_name
    tags = var.tags

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "elasticbeanstalk.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
