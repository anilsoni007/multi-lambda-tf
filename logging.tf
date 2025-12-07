resource "aws_cloudwatch_log_group" "cw_log_grp" {
  for_each = var.lambda_functions
  name     = "/aws/lambda/${each.key}-${var.env}"
  tags     = local.common_tags
}