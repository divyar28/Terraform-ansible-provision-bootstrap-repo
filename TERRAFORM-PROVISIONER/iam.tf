resource "aws_iam_role" "jenkins_iam_role" {
  name = "jenkins_iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}
resource "aws_iam_instance_profile" "jenkins_iam_profile" {
  name = "jenkins_iam_profile"
  role = "${aws_iam_role.jenkins_iam_role.name}"
}
resource "aws_iam_role_policy" "jenkins_iam_policy" {
  name = "jenkins_iam_policy"
  role = "${aws_iam_role.jenkins_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
       "s3:*",
       "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
   

}
