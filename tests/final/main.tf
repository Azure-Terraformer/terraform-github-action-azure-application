terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}

variable "endpoint" {
  type = string
}

data "http" "readme" {
  url    = var.endpoint
  method = "GET"
}
