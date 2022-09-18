
resource "aws_s3_bucket" "bucket" {
  bucket = "s3-shahab-devops"
  acl    = "public-read"

  versioning {
    enabled = true
  }
}
