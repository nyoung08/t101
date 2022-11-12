variable "region" {
  type        = string
  default     = "asia-northeast3"
}

variable "sqlversion" {
  type        = string
  default     = "MYSQL_5_7"
  description =  "MYSQL_5_6 , MYSQL_5_7 , MYSQL_8_0"
}

variable "tier" {
  type        = string
  default     = "db-f1-micro"
  description = "sql machine type"
}

variable "network_id" {
  type        = string
}
