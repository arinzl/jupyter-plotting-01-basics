resource "random_id" "random_id" {
  byte_length = 5

}

#--------------------------------------------------------------------------
# IAM assumable role
#--------------------------------------------------------------------------
module "notebook_instance_iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.0"

  trusted_role_services = [
    "sagemaker.amazonaws.com"
  ]

  role_requires_mfa       = false
  create_role             = true
  create_instance_profile = true

  role_name = "sagemaker-execution-role-plotting01-${random_id.random_id.hex}"

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
  ]

}

resource "aws_iam_role_policy" "sagemaker_execution_policy" {
  name = "sagemake_execution_plotting01_policy"
  role = module.notebook_instance_iam_assumable_role.iam_role_name

  #tags = merge(local.tags_generic)

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "s3:ListBucket"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::${module.sagemaker_s3_bucket.s3_bucket_id}"
        ]
      },
      {
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::${module.sagemaker_s3_bucket.s3_bucket_id}/*"
        ]
      }
    ]
  })
}


#${var.app_name}
