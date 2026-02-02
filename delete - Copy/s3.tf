resource "aws_s3_bucket" "tf_1bucket" {
  bucket = "my-s3-cit-24-01-0396"

  tags = {
    Name        = "my-S3-cit-24-01-0396"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "apache_app" {
  for_each = fileset("${path.module}/code", "**")

  bucket = aws_s3_bucket.tf_1bucket.id
  key    = each.key
  source = "${path.module}/code/${each.key}"

  etag = filemd5("${path.module}/code/${each.key}")
}


output "s3_bucket_name" {
  value = aws_s3_bucket.tf_1bucket.bucket
}