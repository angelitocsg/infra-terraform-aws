resource "aws_ssm_parameter" "pol_parameter" {
  name  = "JU9_Information"
  type  = "String"
  value = "bar"
}