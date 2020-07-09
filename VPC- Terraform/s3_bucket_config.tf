 # create an S3 bucket and a bucket object for the deployment in terraform.
 # This is where your zip will be published when you run `terraform apply`. 
 # For the object key I use the terraform uuid() function.
 # This returns a random unique string, meaning each deployment will be unique.
 # This has a downside (each terraform apply will redeploy the app) but suited my needs.
# ----------------------------------------------------
# The following arguments are supported:

# bucket - (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.
# bucket_prefix - (Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket.
# acl - (Optional) The canned ACL to apply. Defaults to "private". Conflicts with grant.
# grant - (Optional) An ACL policy grant (documented below). Conflicts with acl.

# reference https://www.terraform.io/docs/providers/aws/r/s3_bucket.html


resource "aws_s3_bucket" "dist_bucket" {
  bucket = "nemnous-elb-dist"
  acl    = "private"
}

# The following arguments are supported:

# bucket - (Required) The name of the bucket to put the file in. Alternatively, an S3 access point ARN can be specified.
# key - (Required) The name of the object once it is in the bucket.
# source - (Optional, conflicts with content and content_base64) The path to a file that will be read and uploaded as raw bytes for the object content.


resource "aws_s3_bucket_object" "dist_item" {
  key    = "s3_bucket_test_key"
  bucket = aws_s3_bucket.dist_bucket.id
  source = var.dist_zip
}