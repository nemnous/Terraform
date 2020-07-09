# Argument Reference
# The following arguments are supported:

# name - (Required) A unique name for the this Application Version.
# application - (Required) Name of the Beanstalk Application the version is associated with.
# description - (Optional) Short description of the Application Version.
# bucket - (Required) S3 bucket that contains the Application Version source bundle.
# key - (Required) S3 object that is the Application Version source bundle.
# force_delete - (Optional) On delete, force an Application Version to be deleted when 
#               it may be in use by multiple Elastic Beanstalk Environments.
# tags - Key-value map of tags for the Elastic Beanstalk Application Version
# ---------------------------------------------------------------------------------
# Elastic Beanstalk creates an Amazon S3 bucket named elasticbeanstalk-region-account-id for each region in which you create environments. 
# Elastic Beanstalk uses this bucket to store objects, for example temporary configuration files, that are required for the proper operation
 # of your application.


resource "aws_elastic_beanstalk_application_version" "ebs-app-ver" {
  depends_on = [aws_elastic_beanstalk_application.ebs-app]
  application = aws_elastic_beanstalk_application.ebs-app.name
  bucket = aws_s3_bucket_object.dist_item.bucket
  key = "s3_bucket_test_key"
  name = "v1"
}
