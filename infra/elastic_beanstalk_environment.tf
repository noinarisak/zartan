resource "aws_elastic_beanstalk_environment" "admin" {
  application         = "udp-zartan"
  cname_prefix        = "udp-zartan-admin"
  name                = "admin"
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-2::platform/Python 3.7 running on 64bit Amazon Linux 2/3.0.3"
  solution_stack_name = "64bit Amazon Linux 2 v3.0.3 running Python 3.7"

  tags = {
    project  = "zartan"
    vertical = "admin"
  }

  tier          = "WebServer"
  version_label = "code-pipeline-1595045312314-0932b7444dec7b86cb90c02f3318590d0070f476"
}

resource "aws_elastic_beanstalk_environment" "healthcare" {
  application         = "udp-zartan"
  cname_prefix        = "udp-zartan-healthcare"
  name                = "healthcare"
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-2::platform/Python 3.7 running on 64bit Amazon Linux 2/3.0.3"
  solution_stack_name = "64bit Amazon Linux 2 v3.0.3 running Python 3.7"

  tags = {
    project  = "zartan"
    vertical = "healthcare"
  }

  tier          = "WebServer"
  version_label = "code-pipeline-1595045312717-0932b7444dec7b86cb90c02f3318590d0070f476"
}
