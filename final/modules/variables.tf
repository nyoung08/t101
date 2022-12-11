variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "asia-northeast3"
}

variable "zone" {
  type = string
  default = "asia-northeast3-a"
}

variable "vpcname" {
  type = string
  default = "testnyoung-vpc"
}

variable "subnetname" {
  type = string
  default = "test-subnet"
}

variable "iprange" {
  type = string
  default = "10.0.1.0/24"
}

variable "lbname" {
  type = string
  default = "test-lb"
}

variable "machine_type" {
  type = string
  default = "e2-small"
}

variable "portnum" {
  type = number
  default = 80
}

variable "instancecount" {
  type = number
  default = 2
}

variable "migname" {
  type = string
  default = "test-mig"
}
