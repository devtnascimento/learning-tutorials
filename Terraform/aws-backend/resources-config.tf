
resource "aws_s3_bucket_versioning" "versioning1" {
  bucket = aws_s3_bucket.terraform-source-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "acl1" {
  bucket = aws_s3_bucket.terraform-source-backend.id
  acl    = "private"
}




