resource "aws_iam_role" "lambda_role" {
  name               = "iam_for_lambda"
  assume_role_policy = file("assume_role_policy.json")
}
