data "archive_file" "lambda_zip" {
  for_each    = var.lambda_functions
  type        = "zip"
  source_dir  = "${path.module}/functions/${each.key}"
  output_path = "${path.module}/build/${each.key}.zip"
}

# Lambda function
resource "aws_lambda_function" "main_lambdas" {
  for_each         = var.lambda_functions
  filename         = data.archive_file.lambda_zip[each.key].output_path
  function_name    = "${each.key}-${var.env}"
  role             = aws_iam_role.lambda_role[each.key].arn
  handler          = each.value.handler
  source_code_hash = data.archive_file.lambda_zip[each.key].output_base64sha256
  memory_size      = each.value.memory_size
  runtime          = each.value.runtime
  tags             = local.common_tags
  timeout          = each.value.timeout
  layers           = [for layer_name in each.value.layers : local.layers_mapping[layer_name]]
}