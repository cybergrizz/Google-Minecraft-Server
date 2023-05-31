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
 credentials ="./gcpkeys.json"
 region = var.region
}