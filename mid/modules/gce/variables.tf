variable "name" {
  type = string
  description = "gce vm instance name"
}

variable "machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "tags" {
  type = list(string)
  description = "fw tag" 
  default = []
}

variable "network" {
  type = string
  description = "network name"
}

variable "zone" {
  type = string
  default = "asia-northeast3-a"
}

variable "subnetwork" { 
  type = string 
  default = "nyoung-subnet-seoul"
}
