# Terraform’s data.archive_file directive.

#  It takes a file path and zips it for you. Point this to your image.
#  If you are using Docker images, look into ECR instead.

# create a zip of your deployment with terraform
data "archive_file" "api_dist_zip" {
  type        = "zip"
  source_file = "${path.root}/${var.api_dist}"
  output_path = "${path.root}/${var.api_dist}.zip"
}