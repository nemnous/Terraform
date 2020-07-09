
# https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.javase
# Argument Reference
# The following arguments are supported:

# name - (Required) A unique name for this Environment. This name is used in the application URL
# application – (Required) Name of the application that contains the version to be deployed
# cname_prefix - (Optional) Prefix to use for the fully qualified DNS name of the Environment.
# description - (Optional) Short description of the Environment
# tier - (Optional) Elastic Beanstalk Environment tier. Valid values are Worker or WebServer. If tier is left blank WebServer will be used.
# setting – (Optional) Option settings to configure the new Environment. These override specific values that are set as defaults. The format is detailed below in Option Settings
# solution_stack_name – (Optional) A solution stack to base your environment off of. Example stacks can be found in the Amazon API documentation
# template_name – (Optional) The name of the Elastic Beanstalk Configuration template to use in deployment
# platform_arn – (Optional) The ARN of the Elastic Beanstalk Platform to use in deployment
# wait_for_ready_timeout - (Default: 20m) The maximum duration that Terraform should wait for an Elastic Beanstalk Environment to be in a ready state before timing out.
# poll_interval – The time between polling the AWS API to check if changes have been applied. Use this to adjust the rate of API calls for any create or update action. Minimum 10s, maximum 180s. Omit this to use the default behavior, which is an exponential backoff
# version_label - (Optional) The name of the Elastic Beanstalk Application Version to use in deployment.
# tags – (Optional) A set of tags to apply to the Environment.


resource "aws_elastic_beanstalk_environment" "ebs-env" {
  depends_on = [aws_elastic_beanstalk_application_version.ebs-app-ver]
  name = "sample-application-dev"
  application = aws_elastic_beanstalk_application.ebs-app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.0.3 running Corretto 11"
  cname_prefix = "nemnous"
  version_label = aws_elastic_beanstalk_application_version.ebs-app-ver.name
  

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = "aws-elasticbeanstalk-ec2-role"
    }

  # setting {
  #   "namespace" = "aws:elasticbeanstalk:application:environment""name" = "SERVER_PORT""value" = "5000"
  # }
}

