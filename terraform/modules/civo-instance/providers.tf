terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}
provider "civo" {
  token = var.civo_token
  region = "FRA1"
}
