terraform {
  required_version = ">= 1.3.6"

  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

# Configure the Civo Provider
provider "civo" {
  token  = var.civo_token
}
