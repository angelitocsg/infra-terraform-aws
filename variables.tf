variable "cluster_name" {
  default = "cluster-policoders"
}

variable "capacity_provider" {
  default = "FARGATE"
}

variable "region" {
  default = "us-east-1"
}

variable "region_az_a" {
  default = "us-east-1a"
}

variable "region_az_b" {
  default = "us-east-1b"
}

variable "region_az_c" {
  default = "us-east-1c"
}

variable "microservice" {
  type = string
}