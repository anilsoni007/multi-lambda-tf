resource "aws_iam_role" "lambda_role" {
  for_each = var.lambda_functions
  name     = each.key
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = local.common_tags
}


resource "aws_iam_policy" "lambda_policy" {
  for_each = var.lambda_functions
  name     = "${each.key}-policy"
  path     = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "${aws_cloudwatch_log_group.cw_log_grp[each.key].arn}:*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy-attach" {
  for_each   = var.lambda_functions
  role       = aws_iam_role.lambda_role[each.key].name
  policy_arn = aws_iam_policy.lambda_policy[each.key].arn
}