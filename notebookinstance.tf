resource "aws_sagemaker_notebook_instance" "plot1_ni" {
  name                = "plotting01"
  role_arn            = module.notebook_instance_iam_assumable_role.iam_role_arn
  instance_type       = "ml.t3.medium"
  platform_identifier = "notebook-al2-v2"

}
