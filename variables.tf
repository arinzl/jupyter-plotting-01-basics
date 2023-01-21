variable "region" {
  description = "AWS Region"
  type        = string

}



variable "bucket_prefix" {
  description = "Bucket prefix in lower case, account number will be appended to end of name"
  type        = string

}
