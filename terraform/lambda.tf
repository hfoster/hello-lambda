resource "aws_lambda_function" "hello-lambda" {
  filename      = var.lambda_pkg_filename
  function_name = "hello-lambda"
  runtime       = "go1.x"
  handler       = "main"
  role          = aws_iam_role.lambda_role.arn
}
