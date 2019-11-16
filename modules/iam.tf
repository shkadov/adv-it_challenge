resource "aws_iam_role" "current" {
  name               = "${var.instance_name}-instance"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Principal": { "Service": "ec2.amazonaws.com" },
    "Effect": "Allow"
  }]
}
EOF
}

resource "aws_iam_role_policy" "current" {
  name   = "${var.instance_name}InstanceAccess"
  role   = aws_iam_role.current.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:Describe*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:Describe*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "current" {
  name = "${var.instance_name}-instance"
  role = aws_iam_role.current.name
}