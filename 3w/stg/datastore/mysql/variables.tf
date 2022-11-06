variable "rds_port" {
  type        = number
  default     = 3389
}

##### required

variable "db_user" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}


##### optional

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "tstudydb"
}
