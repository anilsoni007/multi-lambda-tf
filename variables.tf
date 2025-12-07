

variable "env" {
  type    = string
  default = "sandbox"
}

variable "lambda_policy_name" {
  type    = string
  default = "ec2_describe_lambda_policy"
}

variable "lambda_functions" {
  type = map(object({
    handler     = string
    runtime     = string
    timeout     = number
    memory_size = number
    layers      = list(string)
  }))
  default = {
    function1 = {
      handler     = "lambda_function.lambda_handler"
      runtime     = "python3.13"
      timeout     = 45
      memory_size = 128
      layers      = ["requests_layer", "beautifulsoup_layer"]
    },
    function2 = {
      handler     = "lambda_function.lambda_handler"
      runtime     = "python3.13"
      timeout     = 45
      memory_size = 128
      layers      = ["requests_layer"]
    }
  }
}