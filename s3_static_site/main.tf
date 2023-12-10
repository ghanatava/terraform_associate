provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "ghanatava-bucket" {
  bucket = "ghanatava-bucket"
  tags = {
    public_bucket = true
  }
}

resource "aws_s3_bucket_public_access_block" "AB" {
  bucket                  = aws_s3_bucket.ghanatava-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  depends_on              = [aws_s3_bucket.ghanatava-bucket]
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.ghanatava-bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.ghanatava-bucket.arn}/*",
      },
    ],
  })
  depends_on = [aws_s3_bucket_public_access_block.AB]
}

resource "aws_s3_bucket_object" "mysite" {
  bucket = aws_s3_bucket.ghanatava-bucket.id
  key    = "index.html"
  source = "index.html"
  content_type   = "text/html"
}

resource "aws_s3_bucket_website_configuration" "myconf" {
  bucket = aws_s3_bucket.ghanatava-bucket.id
  index_document {
    suffix = "index.html"
  }
  depends_on = [aws_s3_bucket_policy.policy]

}