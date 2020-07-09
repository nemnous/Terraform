# Argument Reference
# The following arguments are supported:

# name - (Required) The name of the application, must be unique within your account
# description - (Optional) Short description of the application
# tags - (Optional) Key-value map of tags for the Elastic Beanstalk Application.
# Application version lifecycle (appversion_lifecycle) supports the following settings. Only one of either max_count or max_age_in_days can be provided:

# service_role - (Required) The ARN of an IAM service role under which the application version is deleted. Elastic Beanstalk must have permission to assume this role.
# max_count - (Optional) The maximum number of application versions to retain ('max_age_in_days' and 'max_count' cannot be enabled simultaneously.).
# max_age_in_days - (Optional) The number of days to retain an application version ('max_age_in_days' and 'max_count' cannot be enabled simultaneously.).
# delete_source_from_s3 - (Optional) Set to true to delete a version's source bundle from S3 when the application version is deleted.

resource "aws_elastic_beanstalk_application" "ebs-app" {
  depends_on = [aws_s3_bucket_object.dist_item]
  name = "spring-helloworld"
  description = "sample spring-helloworld elastic environment"
  appversion_lifecycle {
    service_role = "arn:aws:iam::736271802724:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk"
    max_count = 128
    delete_source_from_s3 = true
  }
}