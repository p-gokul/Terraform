variable "aws_region" {
  default = "ap-northeast-1"
}

variable "github_repo" {
  default = "https://github.com/p-gokul/full-stack-ci-cd"
}

variable "iam_policy_name" {
  default = "codebuild-frontend-s3-cloudfront-access"
}

variable "iam_role_name" {
  default = "codebuild-frontend-role"
}

variable "codebuild_frontend_project_name" {
  default = "TestFrontend"
}

variable "github_secret_arn" {
  default = "your_github_secret_arn"
}



