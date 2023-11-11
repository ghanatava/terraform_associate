provider "aws" {
  region = "ap-south-1"
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id
  tags = {
    public_bucket = true
  }
}


resource "aws_s3_bucket_public_access_block" "sample__block" {
  bucket=aws_s3_bucket.sample.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.sample.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.sample.arn}/*",
      },
    ],
  })
}
