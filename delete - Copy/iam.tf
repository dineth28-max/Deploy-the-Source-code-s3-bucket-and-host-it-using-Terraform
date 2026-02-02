resource "aws_iam_role" "ec2_s3_role" {
  name = "EC2-S3-Access-cit-24-01-0396"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "s3_read_policy" {
  name = "S3-Read-Policy-cit-24-01-0396"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:GetObject"]
      Resource = "arn:aws:s3:::my-s3-cit-24-01-0396/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-Profile-cit-24-01-0396"
  role = aws_iam_role.ec2_s3_role.name
}
