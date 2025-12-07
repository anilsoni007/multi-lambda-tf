locals {
  common_tags = {
    Environment = var.env
    DC          = "Internal Use"
  }
  layers_mapping = {
    requests_layer      = aws_lambda_layer_version.requests_layerss.arn
    beautifulsoup_layer = aws_lambda_layer_version.beaut_Soup_layerss.arn
  }
}