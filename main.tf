resource "github_repository" "s3websitehosting" {
    name = "Website_hosting_S3"
    description = "Website Hosting through S3 "
    visibility = "public"
}


resource "aws_s3_bucket" "website" {
  bucket = var.mybucket
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "object" {
  bucket = var.mybucket
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "object1" {
  bucket = var.mybucket
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
}
resource "aws_s3_object" "object3" {
  bucket = var.mybucket
  key    = "image.png"
  source = "image.png"
  acl = "public-read"
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.website.id
  versioning_configuration {
    status = "Enabled"
  }
}
