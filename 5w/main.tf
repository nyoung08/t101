provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_iam_user" "myiam" {
  for_each = toset(var.user_names)
  name     = each.value
}



output "alluser"{
  value = values(aws_iam_user.myiam)[*].name
}

output "userWithoutTestuser" {
  value = [for user in values(aws_iam_user.myiam)[*].name : user if user !="test"]
}

# 다시 확인해 볼 것, 아래 value로는 if문 제어 안됨
# %{~ for user in values(aws_iam_user.myiam)[*].name ~}
# ${user}%{ if user != "test" }, %{ endif }%{~ endfor ~}


