
resource "aws_lambda_layer_version" "requests_layerss" {
  filename            = "requests_layer.zip"
  layer_name          = "requests_layer"
  compatible_runtimes = ["python3.13"]
}

resource "aws_lambda_layer_version" "beaut_Soup_layerss" {
  filename            = "beautifulsoup_layer.zip"
  layer_name          = "beautifulsoup_layer"
  compatible_runtimes = ["python3.13"]
}