/*
resource "aws_s3_bucket" "net_fw_poc_bucket" {
  bucket = "net-fw-poc-2827673217823912"
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

# Enable versioning so we can see the full revision history of our
# state files
resource "aws_s3_bucket_versioning" "net_fw_poc_state_version" {
  bucket = aws_s3_bucket.net_fw_poc_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "net_fw_poc_state_encryption" {
  bucket = aws_s3_bucket.net_fw_poc_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "net_fw_poc_locks" {
  name         = "net-fw-poc-locks12543543"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
*/