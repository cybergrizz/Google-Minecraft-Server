###Google Provider for Minecraft server###

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.65.2"
    }
  }
}

provider "google" {
 credentials =file(var.credentials_file)
 region = var.region
}