resource "aws_kms_key" "pol_key" {}

resource "aws_kms_alias" "pol_key" {
  name          = "alias/my-key-alias"
  target_key_id = aws_kms_key.pol_key.key_id
}