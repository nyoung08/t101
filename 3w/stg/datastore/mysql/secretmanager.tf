resource "random_password" "master"{
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "mysecret" {
  name = "mysecretmanager_secret"

}
resource "aws_secretsmanager_secret_version" "mysecret_version" {
  secret_id     = aws_secretsmanager_secret.mysecret.id
  secret_string = random_password.master.result
}
