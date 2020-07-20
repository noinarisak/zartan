resource "aws_elastic_beanstalk_application" "zartan" {
  name = "udp-zartan"

  tags = {
    project = "zartan"
  }
}
