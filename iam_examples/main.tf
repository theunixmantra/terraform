resource "aws_iam_user" "rohan_user" {
  name = "rohan"
  tags = { team = "unix team", role = "system admin" }
}

resource "aws_iam_user_policy_attachment" "rohan_policy" {
  user       = "rohan"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy" "kishor_policy" {
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "*",
          "Resource" : "*"
        }
      ]
  })
  name        = "kistor_custom_policy"
  description = "this is a custom policy created using terraform"

}

resource "aws_iam_user_policy_attachment" "kishor_admin" {
  user       = aws_iam_user.sam_user.name
  policy_arn = aws_iam_policy.kishor_policy.arn
}
