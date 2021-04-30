resource "aws_cloudfront_origin_access_identity" "m_cloudfront_origin_access_identity" {
    provider = aws.global

    comment = "access-identity-${var.website_name}"
}

resource "aws_cloudfront_distribution" "m_cloudfront_distribution" {
    provider = aws.global

    origin {
        domain_name = var.domain_name
        origin_id = "s3-${var.website_name}"

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.m_cloudfront_origin_access_identity.cloudfront_access_identity_path
        }
    }
    aliases = var.aliases

    default_cache_behavior {
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods = ["GET","HEAD"]
        cached_methods = ["GET","HEAD"]
        default_ttl = 86400
        max_ttl = 31536000
        min_ttl = 1
        forwarded_values {
            cookies {
                forward = "none"
            }
            query_string = false
        }
        smooth_streaming = false
        compress = true
        target_origin_id = "s3-${var.website_name}"
    }

    viewer_certificate {
        acm_certificate_arn = var.acm_certificate_arn
        ssl_support_method = "sni-only"
        minimum_protocol_version = "TLSv1.2_2019"
    }

    restrictions {
      geo_restriction {
          restriction_type = "none"
      }
    }

    http_version = "http2"
    default_root_object = var.default_root_object
    is_ipv6_enabled = true

    enabled = var.enabled
    tags = var.tags
}