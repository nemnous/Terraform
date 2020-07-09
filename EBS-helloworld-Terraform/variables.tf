variable "api_dist" {
  description = "name of the disribution file"
  type        = string
  default     = "spring-boot-hello-world-rest-api.jar"
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  default     = "nemnous"
}


variable "dist_zip" {
  type        = string
  default     = "spring-boot-hello-world-rest-api.jar.zip"
}